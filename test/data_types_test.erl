-module(data_types_test).
-include_lib("eunit/include/eunit.hrl").

% Test for numbers function
numbers_test() ->
    Expected = [17, 4900, 2.5, 2, 1, 42, 174],
    ?assertEqual(Expected, data_types:numbers()).

% Test for variables function
variables_test() ->
    Expected = [1, 2, 42],
    ?assertEqual(Expected, data_types:variables()).

% Test for atoms function
atoms_test() ->
    Expected = [cat, 'Quoted Atom'],
    ?assertEqual(Expected, data_types:atoms()).

% Test for boolean operations
boolean_operations_test() ->
    Expected = [false, true, false, true],
    ?assertEqual(Expected, data_types:boolean_operations()).

% Test for tuples function
tuples_test() ->
    Expected = [{{4, 5}, 4, 5}],
    ?assertEqual(Expected, data_types:tuples()).

% Test for lists function
lists_test() ->
    Expected = [[1, 2, 3], 1, [2, 3], [0, 1, 2, 3]],
    ?assertEqual(Expected, data_types:lists()).

% Test for list comprehensions
list_comprehensions_test() ->
    Expected = [2, 4, 6, 8],
    ?assertEqual(Expected, data_types:list_comprehensions()).

% Test for bit syntax function
bit_syntax_test() ->
    Pixel = <<240, 154, 41>>,
    Expected = [{Pixel, 240, 154, 41}],
    ?assertEqual(Expected, data_types:bit_syntax()).
