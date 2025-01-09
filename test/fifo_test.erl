-module(fifo_test).
-include_lib("eunit/include/eunit.hrl").

% Test for new function
new_test() ->
    ?_assertEqual({fifo, [], []}, fifo:new()).

% Test for push function
push_test() ->
    [
        {"push_empty", ?_assertEqual({fifo, [1], []}, fifo:push(fifo:new(), 1))},
        {"push_non_empty", ?_assertEqual({fifo, [2, 1], []}, fifo:push({fifo, [1], []}, 2))}
    ].

% Test for pop function
pop_test() ->
    [
        {"pop_single_element", ?_assertEqual({1, {fifo, [], []}}, fifo:pop({fifo, [], [1]}))},
        {"pop_multiple_elements", ?_assertEqual({1, {fifo, [], [2]}}, fifo:pop({fifo, [], [1, 2]}))},
        {"pop_empty_fifo", ?_assertError(badarg, fifo:pop(fifo:new()))}
    ].

% Test for empty function
empty_test() ->
    [
        {"empty_true", ?_assertEqual(true, fifo:empty(fifo:new()))},
        {"empty_false", ?_assertEqual(false, fifo:empty({fifo, [1], []}))}
    ].
