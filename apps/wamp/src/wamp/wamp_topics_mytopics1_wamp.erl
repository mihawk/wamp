-module(wamp_topics_mytopics1_wamp).

%%-behaviour(wamp_pubsub).

-export([subscribe/1]).
-export([unsubscribe/1]).
-export([publish/2]).
-export([publish/3]).
-export([publish/4]).
-export([event/2]).


event(Topic, Event) ->
    %%% do whatever ...
    {ok, [{topic, Topic},{event, Event}]}.

subscribe(Topic) ->
    error_logger:info_msg("Subscribe Topic ~p~n", [Topic]),
    %%% do whatever ...
    {ok, [{topic, Topic},{since, now}]}. 

unsubscribe(Topic) ->
    %%% do whatever ...
    error_logger:info_msg("Unsubscribe Topic ~p~n", [Topic]),
    {ok, Topic}. 

publish(Topic, Event) ->
    %%% do whatever ...
    error_logger:info_msg("Publish Topic ~p~n"
                          "Event ~p~n", 
                          [Topic, Event]),

   {ok, [{topic, Topic}, {event, Event}]}.

publish(Topic, Event, true) ->
    %%% do whatever ...
    error_logger:info_msg("Publish ExcludeMe Topic ~p~n"
                          "Event ~p~n", 
                          [
                           Topic, 
                           Event
                          ]),
   {ok, [{topic, Topic}, {event, Event}, {exclude_me, true}]};

publish(Topic, Event, Exclude) ->
    %%% do whatever ...
   {ok, [{topic, Topic}, {event, Event}, {exclude, Exclude}]}. 
	
publish(Topic, Event, Exclude, Eligible) ->
    %%% do whatever ...
    error_logger:info_msg("Publish ExcludeMe With Eligible List Topic ~p~n"
                          "Event ~p~n"
                          "Exclude ~p~n"
                          "Eligible ~p~n"
                         , 
                          [
                           Topic, 
                           Event,
                           Exclude,
                           Eligible
                          ]),
   {ok, [{topic, Topic}, {event, Event}, {exclude, Exclude}, {eligible, Eligible}]}. 

