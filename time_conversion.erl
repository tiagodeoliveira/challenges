-module(time_conversion).
-export([main/0]).

main() ->
  { ok, [H, M, S, A] } = io:fread("", "~d:~d:~d~s"),
  io:fwrite("~2..0B:~2..0B:~2..0B~n", [convert(H, A), M, S]),
	true.

convert(H, A) when A =:= "AM", H =:= 12 -> 0;
convert(H, A) when A =:= "PM", H =:= 12 -> 12;
convert(H, A) when A =:= "PM" -> H + 12;
convert(H, _A) -> H.
