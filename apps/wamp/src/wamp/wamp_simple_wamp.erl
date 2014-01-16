-module(wamp_simple_wamp, [ReqCtx]).

%%-behaviour(wamp_pubsub).

-export([subscribe/1]).
-export([unsubscribe/1]).
-export([publish/2]).
-export([publish/3]).
-export([publish/4]).

subscribe(Topic) ->
    error_logger:info_msg("Subscribe Topic ~p~n", [Topic]),
    ok.

unsubscribe(Topic) ->
    error_logger:info_msg("Unsubscribe Topic ~p~n", [Topic]),
    ok.

publish(TopicURI, Event) ->
    error_logger:info_msg("Publish Topic ~p~n"
                          "Event ~p~n", 
                          [TopicURI, Event]),

    ok.

publish(TopicURI, Event, true) ->
    error_logger:info_msg("Publish ExcludeMe Topic ~p~n"
                          "Event ~p~n", 
                          [
                           TopicURI, 
                           Event
                          ]),

    ok;

publish(TopicURI, Event, _) ->
    publish(TopicURI, Event).
	
publish(TopicURI, Event, Exclude, Eligible) ->
    error_logger:info_msg("Publish ExcludeMe With Eligible List Topic ~p~n"
                          "Event ~p~n"
                          "Exclude ~p~n"
                          "Eligible ~p~n"
                         , 
                          [
                           TopicURI, 
                           Event,
                           Exclude,
                           Eligible
                          ]),

    ok.

