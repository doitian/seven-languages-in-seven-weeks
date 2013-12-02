eight_queens(List) :-
  length(List, 8),
  eight_queens_domain(List),
  fd_all_different(List),
  eight_queens_add(List, [1,2,3,4,5,6,7,8], Diags1),
  eight_queens_subtract([9,10,11,12,13,14,15,16], List, Diags2),
  fd_all_different(Diags1),
  fd_all_different(Diags2).

eight_queens_add([], [], []).
eight_queens_add([LH|LT], [RH|RT], [H|T]) :-
  H is LH + RH,
  eight_queens_add(LT, RT, T).
eight_queens_subtract([], [], []).
eight_queens_subtract([LH|LT], [RH|RT], [H|T]) :-
  H is LH - RH,
  eight_queens_subtract(LT, RT, T).

eight_queens_domain([]).
eight_queens_domain([H|T]) :-
  member(H, [1,2,3,4,5,6,7,8]),
  eight_queens_domain(T)
  .
