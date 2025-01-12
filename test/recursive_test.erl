-module(recursive_test).
-include_lib("eunit/include/eunit.hrl").

% Test for fac function
fac_test() ->
    [
        {"fac_0", ?_assertEqual(1, recursive:fac(0))},
        {"fac_1", ?_assertEqual(1, recursive:fac(1))},
        {"fac_5", ?_assertEqual(120, recursive:fac(5))},
        {"fac_negative", ?_assertError(badarg, recursive:fac(-1))}
    ].

% Test for len function
len_test() ->
    [
        {"len_empty", ?_assertEqual(0, recursive:len([]))},
        {"len_single", ?_assertEqual(1, recursive:len([a]))},
        {"len_multiple", ?_assertEqual(3, recursive:len([a, b, c]))}
    ].

% Test for tail_fac function
tail_fac_test() ->
    [
        {"tail_fac_0", ?_assertEqual(1, recursive:tail_fac(0))},
        {"tail_fac_1", ?_assertEqual(1, recursive:tail_fac(1))},
        {"tail_fac_5", ?_assertEqual(120, recursive:tail_fac(5))},
        {"tail_fac_negative", ?_assertError(badarg, recursive:tail_fac(-1))}
    ].

% Test for tail_len function
tail_len_test() ->
    [
        {"tail_len_empty", ?_assertEqual(0, recursive:tail_len([]))},
        {"tail_len_single", ?_assertEqual(1, recursive:tail_len([a]))},
        {"tail_len_multiple", ?_assertEqual(3, recursive:tail_len([a, b, c]))}
    ].
