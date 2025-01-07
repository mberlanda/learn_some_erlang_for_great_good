-module(useless).
-author("An Erlang Champ").
% -vsn("1.0.0").
-export([add/2, hello/0, greet_and_add_two/1]).
-compile(debug_info). % -compile([debug_info, export_all]).

add(A, B) ->
    A + B.

hello() ->
    io:format("Hello, world!~n").

greet_and_add_two(X) ->
    hello(),
    add(X, 2).
