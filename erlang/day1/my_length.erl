-module(my_length).
-export([my_length/1]).

my_length([]) ->
    0;
my_length([_|Tail]) ->
    1 + my_length(Tail).

