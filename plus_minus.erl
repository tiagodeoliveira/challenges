-module(plus_minus).
-export([main/0]).

main() ->
  { ok, [Size] } = io:fread("", "~d"),
	{ ok, Items } = read_array("~d", Size),
  Factor = length(Items),
  { Pos, Neg, Zer } = extract_fractions(0, 0, 0, Items),
	io:fwrite("~p~n~p~n~p~n", [Pos / Factor, Neg / Factor, Zer / Factor]),
	true.

get_value(Pos, Neg, Zer, H) when H > 0 -> { Pos + 1, Neg, Zer };
get_value(Pos, Neg, Zer, H) when H < 0 -> { Pos, Neg + 1, Zer };
get_value(Pos, Neg, Zer, _H) -> { Pos, Neg, Zer + 1 }.

extract_fractions(Pos, Neg, Zer, []) -> { Pos, Neg, Zer};
extract_fractions(Pos, Neg, Zer, [H|T]) ->
  { NPos, NNeg, NZer } = get_value(Pos, Neg, Zer, H),
  extract_fractions(NPos, NNeg, NZer, T).

read_array(Format, Size) -> io:fread("", repeat(Format, Size)).
repeat(Str, Times) -> lists:flatten(lists:duplicate(Times, Str)).
