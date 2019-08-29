import std.stdio;
import std.net.curl;
import std.json;
import std.algorithm: map;
import std.array: array;

import glustercli;

void main(string[] args)
{
    auto url = args[1];
    auto jsonVal = JSONValue(
        [
            "peers": peerStatus().map!(peer => peer.toJson).array,
            "volumes": volumeStatus().map!(vol => vol.toJson).array
        ]);
    auto details = jsonVal.toJSON(false, JSONOptions.doNotEscapeSlashes);
    writeln("DATA: --------------------------");
    writeln(details);
    writeln();
    auto http = HTTP();
    http.addRequestHeader("Content-Type", "application/json");
    auto content = post(url, details, http);
    writeln("[OK] pushed peer and volume details to the webhook: ", url, content);
}
