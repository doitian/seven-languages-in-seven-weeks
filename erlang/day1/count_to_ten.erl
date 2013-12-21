-module(count_to_ten).
-export([run/0]).

count(10) ->
    io:format("~p~n", [10]);
count(N) ->
    io:format("~p~n", [N]),
    count(N + 1).

run() -> count(1).
