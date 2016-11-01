-module(diagonal_difference).

-export([main/0]).

main() ->
    {ok, [Size]} = io:fread("", "~d"),
    Items = read_2darray(Size, Size, "~d"),
    % Items [[11, 2],
    %        [4 , 5]]

    % Items [[11, 2,   4],
    %        [4 , 5,   6],
    %        [10, 8, -12]]

    % Items [[11, 2,   4, 3],
    %        [4 , 5,   6, 1],
    %        [10, 8, -12, -3]]
    %        [3 , 1,  16, 9]]
    true.

diagonal([H|T], I) ->


read_array(0,_D) -> [];
read_array(N,D) ->
   {ok, [X]} = io:fread("", D),
   [X | read_array(N-1,D)].

read_2darray(0,_M,_D) -> [];
read_2darray(N,M,D) ->
   Q=read_array(M,D),
   [Q | read_2darray(N-1,M,D)].
