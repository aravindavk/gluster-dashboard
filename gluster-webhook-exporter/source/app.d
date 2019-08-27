import std.stdio;
import std.net.curl;
import std.json;
import std.algorithm: map;
import std.array: array;

import glustercli;

void main(string[] args)
{
    auto peerUrl = args[1] ~ "/peers";
    auto volUrl = args[1] ~ "/volumes";
    writeln(peerUrl, volUrl);
    
    auto peers = peerStatus();
    auto jsonValPeers = JSONValue(["peers": peers.map!(peer => peer.toJson).array]);
    auto peerDetails = jsonValPeers.toJSON(false, JSONOptions.doNotEscapeSlashes);
    writeln(peerDetails);
    auto httpPeer = HTTP();
    httpPeer.addRequestHeader("Content-Type", "application/json");
    auto contentPeer = post(peerUrl, peerDetails, httpPeer);
    writeln("pushed peer details to the webhook: ", args[1], contentPeer);

    auto vols = volumeStatus();
    auto jsonValVols = JSONValue(["volumes": vols.map!(vol => vol.toJson).array]);
    auto volDetails = jsonValVols.toJSON(false, JSONOptions.doNotEscapeSlashes);
    writeln(volDetails);

    auto httpVol = HTTP();
    httpVol.addRequestHeader("Content-Type", "application/json");
    auto contentVol = post(volUrl, volDetails, httpVol);
    writeln("pushed volume details to the webhook: ", args[1], contentVol);
}
