my_sort_split(_, [], [], []).
my_sort_split(Pivot, [A], [A], []) :- A < Pivot.
my_sort_split(Pivot, [A], [], [A]) :- A >= Pivot.
my_sort_split(Pivot, [H|T], [H|LT], R) :- H < Pivot, my_sort_split(Pivot, T, LT, R).
my_sort_split(Pivot, [H|T], L, [H|RT]) :- H >= Pivot, my_sort_split(Pivot, T, L, RT).

% my_sort(List, Sorted)
my_sort([], []).
my_sort([A], [A]).
my_sort([H|T], Sorted) :- my_sort_split(H, T, L, R), my_sort(L, SortedL), my_sort(R, SortedR), append(SortedL, [H|SortedR], Sorted).
