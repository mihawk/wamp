%%-module(wamp_simple_wamp, [Req, SessionId]).
-module(wamp_simple_wamp).

-export([calc/2]).

%%
%%-spec calc(binary(), binary()) -> {ok, result()} | {error, reason()} | {error, reason(), err_detail()}.
%%
calc(_Op, _Num) ->
  %%Val = boss_session:get_data(SessionId),
  {ok, ok}. 

