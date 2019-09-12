import std.net.curl: HTTP, post;
import std.json;
import std.algorithm: map;
import std.array: array;
import std.getopt;
import core.thread;
import std.experimental.logger;

import glustercli;

int main(string[] args)
{
    string url;
    int interval = 30;
    bool verbose;

    try
    {
        auto helpInformation = getopt(
            args,
            std.getopt.config.required,
            "u|url", "Webhook URL", &url,
            "t|interval", "Webhook push interval", &interval,
            "v|verbose", "Verbose output", &verbose);

        if (helpInformation.helpWanted)
        {
            defaultGetoptPrinter("Usage: gluster-webhook-exporter [OPTIONS]",
                                 helpInformation.options);
            return 0;
        }
    }
    catch (GetOptException ex)
    {
        import std.stdio: stderr;

        stderr.writeln("Invalid inputs: ", ex.msg);
        return 1;
    }

    // Minimum interval is 5 seconds
    if (interval <= 5)
        interval = 5;

    // Default log level as info. Set to trace if --verbose is set
    sharedLog.logLevel = LogLevel.info;
    if (verbose)
    {
        sharedLog.logLevel = LogLevel.trace;
    }

    // Summary
    infof("exporter started. [{url=%s}, {interval_seconds=%d}, {verbose=%s}]",
          url, interval, verbose);

    while (true)
    {
        auto jsonVal = JSONValue(
            [
                "peers": peerStatus().map!(peer => peer.toJson).array,
                "volumes": volumeStatus().map!(vol => vol.toJson).array
                ]);
        auto details = jsonVal.toJSON(false, JSONOptions.doNotEscapeSlashes);
        trace(details);
        auto http = HTTP();
        http.addRequestHeader("Content-Type", "application/json");
        auto content = post(url, details, http);
        info("pushed peer and volume details to the webhook");
        Thread.sleep(dur!("seconds")(interval));
    }
}
