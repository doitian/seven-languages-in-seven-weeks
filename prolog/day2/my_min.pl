my_min(A, [A]).
my_min(Head, [Head|Tail]) :- my_min(Min, Tail), Head =< Min.
my_min(Min, [Head|Tail]) :- my_min(Min, Tail), Head > Min.
