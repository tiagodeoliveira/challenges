-module(triplets).
-compile(export_all).
-export([main/0]).

main() ->
	[ArrA, ArrB] = read_2darray(2, 3, "~d"),
	{ ResultA, ResultB } = iterate(ArrA, 0, ArrB, 0),
	io:fwrite("~p ~p", [ResultA, ResultB]),
	true.

iterate([], ValA, [], ValB) -> { ValA, ValB };
iterate([HeadA|TailA], ValA, [HeadB|TailB], ValB) -> 
    	{ ResA, ResB } = compare(HeadA, ValA, HeadB, ValB),
	iterate(TailA, ResA, TailB, ResB).

compare(ValA, RetA, ValB, RetB) when ValA > ValB -> { RetA + 1, RetB };
compare(ValA, RetA, ValB, RetB) when ValB > ValA -> { RetA, RetB + 1 };
compare(_ValA, RetA, _ValB, RetB) -> { RetA, RetB }.

read_array(0,_D) -> [];
read_array(N,D) -> 
   {ok, [X]} = io:fread("", D),
   [X | read_array(N-1,D)].

read_2darray(0,_M,_D) -> [];
read_2darray(N,M,D) ->
   Q=read_array(M,D),
   [Q | read_2darray(N-1,M,D)].

