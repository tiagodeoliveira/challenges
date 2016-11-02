-module(circular_array_rotation).
-export([main/0]).

main() ->
    { ok, [N, K, Q] } = io:fread("", "~d~d~d"),
    A = read_array(N, "~d"),
    Q_list = read_array(Q, "~d"),
    M = N rem K,
    print_list(Q_list, M, A),
    true.

print_list([], _M, _Arr) -> true;
print_list([H|T], M, Arr) ->
  P = (H + M) rem length(Arr),
  io:fwrite("~p~n", [lists:nth(P + 1, Arr)]),
  print_list(T, M, Arr).

read_array(0,_D) -> [];
read_array(N,D) ->
   {ok, [X]} = io:fread("", D),
   [X | read_array(N-1,D)].
