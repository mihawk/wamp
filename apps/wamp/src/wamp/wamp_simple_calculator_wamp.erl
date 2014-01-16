-module(wamp_simple_calculator_wamp, [Req, SessionId, ReqCtx]).

-export([calc/1]).
-export([calc/2]).

%% it is a simple calculator ;)
%% the goal is to show how to use wamp rpc

calc({<<"op">>, <<"C">>}) ->
    calc({<<"op">>, <<"C">>}, {<<"num">>, 0}).    
calc({<<"op">>, Op},{<<"num">>, Num}) when is_binary(Num)->
    calc(Op,binary_to_integer(Num));

calc(Op, Num) ->
    Stack = get_stack(SessionId),
    Result = case Op of 
                 <<"+">> ->
                     Stack + Num;
                 <<"-">> ->
                     Stack - Num;
                 <<"*">> ->
                     Stack * Num;
                 <<"/">> ->
                     case Num of 
                         0 -> infinit;
                         _ ->
                             Stack / Num
                     end;
                 <<"C">> ->
                     0;
                 <<"=">> ->
                     Stack;
                 _ ->
                     {error, unknow_operation}
             end,

    case Result of 
        {error, _} = Err ->
            set_stack(SessionId, 0),
            Err;
        _ ->
            set_stack(SessionId, Result),
            {ok, Result}
    end.

get_stack(Id) ->
    case boss_session:get_session_data(Id, calc_stack) of 
        undefined ->
            0;
        S ->
            S
    end.

set_stack(Id, Stack) ->
    boss_session:set_session_data(Id, calc_stack, Stack).

