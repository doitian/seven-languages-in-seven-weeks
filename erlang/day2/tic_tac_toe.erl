-module(tic_tac_toe).
-export([judge/1]).

judge_cat_or_no_winner([]) ->
    cat;
judge_cat_or_no_winner([o|Tail]) ->
    judge_cat_or_no_winner(Tail);
judge_cat_or_no_winner([x|Tail]) ->
    judge_cat_or_no_winner(Tail);
judge_cat_or_no_winner(_) ->
    no_winner.

judge([W, W, W, _, _, _, _, _, _]) when W == o; W == x ->
    W;
judge([_, _, _, W, W, W, _, _, _]) when W == o; W == x ->
    W;
judge([_, _, _, _, _, _, W, W, W]) when W == o; W == x ->
    W;
judge([W, _, _, W, _, _, W, _, _]) when W == o; W == x ->
    W;
judge([_, W, _, _, W, _, _, W, _]) when W == o; W == x ->
    W;
judge([_, _, W, _, _, W, _, _, W]) when W == o; W == x ->
    W;
judge([W, _, _, _, W, _, _, _, W]) when W == o; W == x ->
    W;
judge([_, _, W, _, W, _, W, _, _]) when W == o; W == x ->
    W;
judge(Board) ->
    judge_cat_or_no_winner(Board).
