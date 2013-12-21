-module(my_key_find).
-export([my_key_find/2]).

my_key_find(_, []) ->
    false;
my_key_find(_Key, [{_Key, Value}|_]) ->
    Value;
my_key_find(Key, [_|Tail]) ->
    my_key_find(Key, Tail).
