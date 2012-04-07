-module(logging_server).
-export([start_link/0, init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-behavior(gen_server).

init([]) -> {ok, []}.

start_link() -> gen_server:start_link(?MODULE, [], []).

handle_call({log, Message, Time}, _From, Foo) ->
  io:format("logged message: ~p:: ~p~n", [Time, Message]),
  {noreply, Foo}.

handle_cast({log, Message, Time}, Foo) ->
  Data = string:join([Time, Message], "::"),
  io:format("logged message: ~p~n", [Data]),
  file:write_file("/var/tmp/erlang_logger.log", Data ++ "\n", [append]),
  {noreply, Foo}.

handle_info(Msg, Foo) ->
  io:format("Unexepteced message: ~p~n", [Msg]),
  {noreply, Foo}.

terminate(normal, Foo) ->
  io:format("~p was set free.~n", [Foo]),
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.
