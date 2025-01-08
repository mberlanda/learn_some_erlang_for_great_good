-module(functions_test).
-include_lib("eunit/include/eunit.hrl").

% Test for greet function
greet_test() ->
    [
        {"greet_male", ?_assertEqual("Hello, Mr. Doe!", functions:greet(male, "Doe"))},
        {"greet_female", ?_assertEqual("Hello, Mrs. Doe!", functions:greet(female, "Doe"))},
        {"greet_any", ?_assertEqual("Hello, Doe!", functions:greet(any, "Doe"))}
    ].

% Test for head function
head_test() ->
    [
        {"head_empty", ?_assertError(badarg, functions:head([]))},
        {"head_non_empty", ?_assertEqual(1, functions:head([1, 2, 3]))}
    ].

% Test for second function
second_test() ->
    [
        {"second_empty", ?_assertError(badarg, functions:second([]))},
        {"second_single", ?_assertError(badarg, functions:second([1]))},
        {"second_non_empty", ?_assertEqual(2, functions:second([1, 2, 3]))}
    ].

% Test for same function
same_test() ->
    [
        {"same_true", ?_assertEqual(true, functions:same(1, 1))},
        {"same_false", ?_assertEqual(false, functions:same(1, 2))},
        {"same_undefined", ?_assertError(badarg, functions:same(undefined, 1))},
        {"same_type_mismatch", ?_assertEqual(false, functions:same(1, "1"))}
    ].
