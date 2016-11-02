-module(staircase).
-export([main/0]).

main() ->
  { ok, [Size] } = io:fread("", "~d"),
  print(Size, Size - 1),
	true.

print(Size, 0) -> io:fwrite("~s~n", [repeat("#", Size)]);
print(Size, Spaces) ->
  io:fwrite("~s~s~n", [repeat(" ", Spaces), repeat("#", Size - Spaces)]),
  print(Size, Spaces - 1).

repeat(Str, Times) -> lists:flatten(lists:duplicate(Times, Str)).
