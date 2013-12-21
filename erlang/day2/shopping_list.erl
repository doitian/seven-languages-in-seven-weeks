-module(shopping_list).
-export([subtotalize/1]).

subtotalize(Cart) ->
    [{Product, Quantity * Price} || {Product, Quantity, Price} <- Cart].

