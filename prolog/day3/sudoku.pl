% sudoku(Puzzle, Solution) - solves 9x9 Sudoku with 3x3 squares
sudoku(Puzzle, Solution) :-
  Puzzle = Solution,
  fd_domain(Solution, 1, 9),
  Solution = [ E11,E12,E13,E14,E15,E16,E17,E18,E19,
               E21,E22,E23,E24,E25,E26,E27,E28,E29,
               E31,E32,E33,E34,E35,E36,E37,E38,E39,
               E41,E42,E43,E44,E45,E46,E47,E48,E49,
               E51,E52,E53,E54,E55,E56,E57,E58,E59,
               E61,E62,E63,E64,E65,E66,E67,E68,E69,
               E71,E72,E73,E74,E75,E76,E77,E78,E79,
               E81,E82,E83,E84,E85,E86,E87,E88,E89,
               E91,E92,E93,E94,E95,E96,E97,E98,E99 ],
  R1 = [ E11,E12,E13,E14,E15,E16,E17,E18,E19 ],
  R2 = [ E21,E22,E23,E24,E25,E26,E27,E28,E29 ],
  R3 = [ E31,E32,E33,E34,E35,E36,E37,E38,E39 ],
  R4 = [ E41,E42,E43,E44,E45,E46,E47,E48,E49 ],
  R5 = [ E51,E52,E53,E54,E55,E56,E57,E58,E59 ],
  R6 = [ E61,E62,E63,E64,E65,E66,E67,E68,E69 ],
  R7 = [ E71,E72,E73,E74,E75,E76,E77,E78,E79 ],
  R8 = [ E81,E82,E83,E84,E85,E86,E87,E88,E89 ],
  R9 = [ E91,E92,E93,E94,E95,E96,E97,E98,E99 ],
  C1 = [ E11,E21,E31,E41,E51,E61,E71,E81,E91 ],
  C2 = [ E12,E22,E32,E42,E52,E62,E72,E82,E92 ],
  C3 = [ E13,E23,E33,E43,E53,E63,E73,E83,E93 ],
  C4 = [ E14,E24,E34,E44,E54,E64,E74,E84,E94 ],
  C5 = [ E15,E25,E35,E45,E55,E65,E75,E85,E95 ],
  C6 = [ E16,E26,E36,E46,E56,E66,E76,E86,E96 ],
  C7 = [ E17,E27,E37,E47,E57,E67,E77,E87,E97 ],
  C8 = [ E18,E28,E38,E48,E58,E68,E78,E88,E98 ],
  C9 = [ E19,E29,E39,E49,E59,E69,E79,E89,E99 ],
  B1 = [ E11,E12,E13,E21,E22,E23,E31,E32,E33 ],
  B2 = [ E41,E42,E43,E51,E52,E53,E61,E62,E63 ],
  B3 = [ E71,E72,E73,E81,E82,E83,E91,E92,E93 ],
  B4 = [ E14,E15,E16,E24,E25,E26,E34,E35,E36 ],
  B5 = [ E44,E45,E46,E54,E55,E56,E64,E65,E66 ],
  B6 = [ E74,E75,E76,E84,E85,E86,E94,E95,E96 ],
  B7 = [ E17,E18,E19,E27,E28,E29,E37,E38,E39 ],
  B8 = [ E47,E48,E49,E57,E58,E59,E67,E68,E69 ],
  B9 = [ E77,E78,E79,E87,E88,E89,E97,E98,E99 ],
  sudoku_valid([ R1,R2,R3,R4,R5,R6,R7,R8,R9,
                 C1,C2,C3,C4,C5,C6,C7,C8,C9,
                 B1,B2,B3,B4,B5,B6,B7,B8,B9 ])
  .

sudoku_valid([]).
sudoku_valid([H|T]) :-
  fd_all_different(H), 
  sudoku_valid(T).

% sudoku_print(Puzzle, Solution) - solves Sudoku and print Solution
sudoku_and_print(Puzzle, Solution) :-
  sudoku(Puzzle, Solution),
  sudoku_print_board(Solution).

sudoku_print_board(Solution) :-
  Solution = [ E11,E12,E13,E14,E15,E16,E17,E18,E19,
               E21,E22,E23,E24,E25,E26,E27,E28,E29,
               E31,E32,E33,E34,E35,E36,E37,E38,E39,
               E41,E42,E43,E44,E45,E46,E47,E48,E49,
               E51,E52,E53,E54,E55,E56,E57,E58,E59,
               E61,E62,E63,E64,E65,E66,E67,E68,E69,
               E71,E72,E73,E74,E75,E76,E77,E78,E79,
               E81,E82,E83,E84,E85,E86,E87,E88,E89,
               E91,E92,E93,E94,E95,E96,E97,E98,E99 ],
  format("%d %d %d | %d %d %d | %d %d %d~N", [E11,E12,E13,E14,E15,E16,E17,E18,E19]),
  format("%d %d %d | %d %d %d | %d %d %d~N", [E21,E22,E23,E24,E25,E26,E27,E28,E29]),
  format("%d %d %d | %d %d %d | %d %d %d~N", [E31,E32,E33,E34,E35,E36,E37,E38,E39]),
  format("------+-------+------~N", []),
  format("%d %d %d | %d %d %d | %d %d %d~N", [E41,E42,E43,E44,E45,E46,E47,E48,E49]),
  format("%d %d %d | %d %d %d | %d %d %d~N", [E51,E52,E53,E54,E55,E56,E57,E58,E59]),
  format("%d %d %d | %d %d %d | %d %d %d~N", [E61,E62,E63,E64,E65,E66,E67,E68,E69]),
  format("------+-------+------~N", []),
  format("%d %d %d | %d %d %d | %d %d %d~N", [E71,E72,E73,E74,E75,E76,E77,E78,E79]),
  format("%d %d %d | %d %d %d | %d %d %d~N", [E81,E82,E83,E84,E85,E86,E87,E88,E89]),
  format("%d %d %d | %d %d %d | %d %d %d~N", [E91,E92,E93,E94,E95,E96,E97,E98,E99]).
