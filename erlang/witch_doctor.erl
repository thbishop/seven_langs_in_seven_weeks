-module(witch_doctor).
-export([bless/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    {'EXIT', From, Reason} ->
      io:format("The doctor ~p died with reason ~p.", [From, Reason]),
      io:format("Starting another one.~n"),
      doctor:new(),
      loop();

    watch ->
      io:format("I am going to bless you~n"),
      link(whereis(doc)),
      io:format("You have been blessed~n"),
      loop()

end.

bless() ->
  Pid = spawn(fun loop/0),
  Pid ! watch.
