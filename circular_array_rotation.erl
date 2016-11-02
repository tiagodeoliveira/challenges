-module(circular_array_rotation).
-export([main/0]).

main() ->
    { ok, [N, K, Q] } = io:fread("", "~d~d~d"),
    A = read_array(N, "~d"),
    Q_list = lists:seq(1, Q),
    lists:foreach(
      fun(Q0) ->
        { ok, [M] } = io:fread("", "~d")
      end,
      Q_list),
      case N rem K ->
        0 ->

    true.

rotate(A, K) ->


read_array(0,D) -> [];
read_array(N,D) ->
   {ok, [X]} = io:fread("", D),
   [X | read_array(N-1,D)].
