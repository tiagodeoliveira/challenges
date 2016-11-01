-module(very_big_sum).
-export([main/0]).

main() ->
	{ ok, [Size] } = io:fread("", "~d"),
	{ ok, Items } = read_array("~d", Size),
	io:fwrite("~p~n", [lists:sum(Items)]),
	true.

read_array(Format, Size) -> io:fread("", repeat(Format, Size)).
repeat(Str, Times) -> lists:flatten(lists:duplicate(Times, Str)).
