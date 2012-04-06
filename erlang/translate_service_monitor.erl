-module(translate_service_monitor).
-export([loop/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Spinning up the translator service for you~n"),
      register(translate_service, spawn_link(fun translate_service:loop/0)),
      loop();

    {'EXIT', From, Reason} ->
      io:format("The translator service ~p died with reason ~p.", [From, Reason]),
      self() ! new,
      loop()

end.
