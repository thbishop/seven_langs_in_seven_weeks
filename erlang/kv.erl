-module(kv).
-export([val_at/2]).

val_at(List, TargetKey) ->
  Values = [ Value || {Key, Value} <- List, Key == TargetKey ],
  first_val(Values).

first_val([]) -> false;
first_val(List) ->
  [X|_] = List,
  X.
