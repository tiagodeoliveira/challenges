-module(diagonal_difference).
-export([main/0]).

% Items [[11, 2],
%        [4 , 5]] = |11+5 - 4+5|

% Items [[11, 2,   4],
%        [4 , 5,   6],
%        [10, 8, -12]] = |(11+5+-12) - (4+5+10)|

% Items [[11, 2,   4, 3],
%        [4 , 5,   6, 1],
%        [10, 8, -12, -3]]
%        [3 , 1,  16, 9]] = |11+5+-12+0 - 3+6+8+3|

main() ->
    {ok, [Size]} = io:fread("", "~d"),
    Items = read_2darray(Size, Size, "~d"),
    io:fwrite("~p~n", [diagonal_sum(Items, 1, 0)]),
    true.

diagonal_sum([], _I, S) -> abs(S);
diagonal_sum([H|T], I, S) ->
  Element1 = lists:nth(I, H),
  Element2 = lists:nth(I, lists:reverse(H)),
  diagonal_sum(T, I + 1, S + (Element1 - Element2)).

read_array(0,_D) -> [];
read_array(N,D) ->
   {ok, [X]} = io:fread("", D),
   [X | read_array(N-1,D)].

read_2darray(0,_M,_D) -> [];
read_2darray(N,M,D) ->
   Q=read_array(M,D),
   [Q | read_2darray(N-1,M,D)].
