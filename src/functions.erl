-module(functions).
-export([greet/2, head/1, second/1, same/2]).

% https://www.erlang.org/doc/system/typespec.html
% Pattern matching on Gender atoms
greet(male, Name) ->
    io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
    io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
    io:format("Hello, ~s!", [Name]).

head([Head | _]) -> Head.
second([_, Second | _]) -> Second.

same(X, X) -> true;
same(_,_) -> false.
