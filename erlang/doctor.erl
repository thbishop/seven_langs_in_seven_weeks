-module(doctor).
-export([loop/0, new/0]).

loop() ->
  receive
    serve ->
      io:format("Sure, how can I help you?~n"),
      loop();

    die ->
      io:format("I'm dead.~n"),
      exit({doc, die, at, erlang:time()});

    _ ->
      io:format("not sure~n"),
      loop()

end.

new() ->
  register(doc, spawn(fun loop/0)),
  witch_doctor:bless().
  io:format("The doctor is on duty~n"),
