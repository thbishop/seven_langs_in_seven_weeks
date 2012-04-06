-module(pass_fail).
-export([result/1]).

result({success}) -> io:format("success\n", []);
result({error, Message}) -> io:format("error: ~p\n", [Message]).
