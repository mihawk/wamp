-module(wamp_examples_controller, [Req, SessionId]).
-compile(export_all).

index('GET', []) ->
    ok.

calculator('GET', []) ->
    ok.

keyvalue('GET', []) ->
    ok.

dirwatch('GET', []) ->
    ok.

pubsub('GET', []) ->
    ok.

dbus('GET', []) ->
    ok.

authentication('GET', []) ->
    ok.

