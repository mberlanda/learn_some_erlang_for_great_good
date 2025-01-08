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

% Test for old_enough function
old_enough_test() ->
    [
        {"old_enough_true", ?_assertEqual(true, functions:old_enough(16))},
        {"old_enough_false", ?_assertEqual(false, functions:old_enough(15))},
        {"old_enough_undefined", ?_assertError(badarg, functions:old_enough(undefined))}
    ].

% Test for right_age function
right_age_test() ->
    [
        {"right_age_true", ?_assertEqual(true, functions:right_age(16))},
        {"right_age_false", ?_assertEqual(false, functions:right_age(15))},
        {"right_age_undefined", ?_assertError(badarg, functions:right_age(undefined))}
    ].

% Test for wrong_age function
wrong_age_test() ->
    [
        {"wrong_age_true", ?_assertEqual(true, functions:wrong_age(104))},
        {"wrong_age_false", ?_assertEqual(false, functions:wrong_age(16))},
        {"wrong_age_undefined", ?_assertError(badarg, functions:wrong_age(undefined))}
    ].

% Test for compare_with_true function
compare_with_true_test() ->
    [
        {"compare_with_true_a", ?_assertEqual("a", functions:compare_with_true(2, 1))},
        {"compare_with_true_b", ?_assertEqual("b", functions:compare_with_true(1, 2))},
        {"compare_with_true_c", ?_assertEqual("c", functions:compare_with_true(1, 1))}
    ].

% Test for compare_with_match function
compare_with_match_test() ->
    [
        {"compare_with_match_a", ?_assertEqual("a", functions:compare_with_match(2, 1))},
        {"compare_with_match_b", ?_assertEqual("b", functions:compare_with_match(1, 2))},
        {"compare_with_match_c", ?_assertEqual("c", functions:compare_with_match(1, 1))}
    ].

% Test to show equivalence of compare_with_true and compare_with_match
compare_equivalence_test() ->
    [
        {"compare_equivalence_a", ?_assertEqual(functions:compare_with_true(2, 1), functions:compare_with_match(2, 1))},
        {"compare_equivalence_b", ?_assertEqual(functions:compare_with_true(1, 2), functions:compare_with_match(1, 2))},
        {"compare_equivalence_c", ?_assertEqual(functions:compare_with_true(1, 1), functions:compare_with_match(1, 1))}
    ].

% Test for insert function
insert_test() ->
    [
        {"insert_new_element", ?_assertEqual([1], functions:insert(1, []))},
        {"insert_existing_element", ?_assertEqual([1], functions:insert(1, [1]))},
        {"insert_multiple_elements", ?_assertEqual([2, 1], functions:insert(2, [1]))}
    ].

% Test for beach function
beach_test() ->
    [
        {"beach_favorable_celsius", ?_assertEqual('favorable', functions:beach({celsius, 25}))},
        {"beach_scientifically_favorable_kelvin", ?_assertEqual('scientifically favorable', functions:beach({kelvin, 300}))},
        {"beach_favorable_fahrenheit", ?_assertEqual('favorable in the US', functions:beach({fahrenheit, 75}))},
        {"beach_avoid", ?_assertEqual('avoid beach', functions:beach({celsius, 10}))}
    ].
