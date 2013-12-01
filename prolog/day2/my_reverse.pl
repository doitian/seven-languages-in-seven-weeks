% my_reverse_split(List, Remaining, Reversed)
my_reverse_split(List, List, []).
my_reverse_split(List, Remaining, [Head|Tail]) :-
  my_reverse_split(List, [Head|Remaining], Tail).

% my_reverse(List, Reversed)
my_reverse(List, Reversed) :- my_reverse_split(List, [], Reversed).
