-module(ten).
-export([count/1]).

count(0)   -> count(1);
count(10) -> io:format("10\nAll done!\n", []);
count(N)  ->
  io:format("~p\n", [N]), count(N + 1).
