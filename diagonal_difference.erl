-module(diagonal_difference).
-export([main/0]).

main() ->
    { ok, [N]} = io:fread("", "~d"),
    A = read_2darray(N,N,"~d"),
    true.
