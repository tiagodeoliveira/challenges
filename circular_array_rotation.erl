-module(circular_array_rotation).
-export([main/0]).

main() ->
    { ok, [N, K, Q] } = io:fread("", "~d~d~d"),
    { ok, A } = read_array(N, "~d"),
    { ok, Q_list } = read_array(Q, "~d"),
    M = K rem N, % get the rotation module/factor
    print_list(Q_list, M, A),
    true.

print_list([], _M, _Arr) -> true;
print_list([H|T], M, Arr) ->
  Arr_size = length(Arr),
  Pos = if
    M =:= 0 -> H + 1;
    true -> (H + 1 + (Arr_size - M))
  end,
  P = if
    Pos > length(Arr) -> Pos rem length(Arr);
    true -> Pos
  end,
  io:fwrite("Printing position ~p with module ~p with array = ~p IS: ~p~n", [H, M, length(Arr), P]),
  io:fwrite("~p~n", [lists:nth(P, Arr)]),
  print_list(T, M, Arr).

read_array(Size, Format) -> io:fread("", repeat(Format, Size)).
repeat(Str, Times) -> lists:flatten(lists:duplicate(Times, Str)).
