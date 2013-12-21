-module(print_result).
-export([print_result/1]).

print_result(success) ->
    io:format("success~n");
print_result({error, Message}) ->
    io:format("error: ~p~n", [Message]).


