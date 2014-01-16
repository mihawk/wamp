-module(wamp_event_wamp).

-export([subscribe/1]).
-export([unsubscribe/1]).
-export([publish/2]).
-export([publish/3]).
-export([publish/4]).
-export([event/2]).

get_time()->
    Now = erlang:now(), 
    {{Y, Mo, D}, {H, Mi, S}} = calendar:now_to_datetime(Now),
    io_lib:format("~4.4.0w-~2.2.0w-~2.2.0w ~2.2.0w:~2.2.0w:~2.2.0w", [ Y, Mo, D, H, Mi, S ]).

event(Topic, Event) when is_list(Topic)->
    event(list_to_binary(Topic), Event);
event(<<"event:chatroom">>, [[{<<"message">>, Msg}]]) ->
    Time = get_time(), 
    M = "[" ++ Time ++ "]   " ++ binary_to_list(Msg),
    Event = [[{<<"message">>, list_to_binary(M)}]],
    {ok, [{topic, <<"event:chatroom">>}, {event, Event} ] };
event(Topic, Event) ->
    {ok, [{topic, Topic}, {event, Event} ] }.

subscribe(Topic) when is_binary(Topic)->
    subscribe(binary_to_list(Topic));
subscribe(Topic) ->
    %%% do whatever ...
    {ok, [{topic, Topic},{since, now}]}. 

unsubscribe(Topic) when is_binary(Topic)->
    unsubscribe(binary_to_list(Topic));
unsubscribe(Topic) ->
    %%% do whatever ...
    {ok, Topic}. 

publish(Topic, Event) ->
    %%% do whatever ...
   {ok, [{topic, Topic}, {event, Event}]}.

publish(Topic, Event, true) ->
    %%% do whatever ...
   {ok, [{topic, Topic}, {event, Event}, {exclude_me, true}]};

publish(Topic, Event, Exclude) ->
    %%% do whatever ...
   {ok, [{topic, Topic}, {event, Event}, {exclude, Exclude}]}. 
	
publish(Topic, Event, Exclude, Eligible) ->
    %%% do whatever ...
   {ok, [{topic, Topic}, {event, Event}, {exclude, Exclude}, {eligible, Eligible}]}. 

