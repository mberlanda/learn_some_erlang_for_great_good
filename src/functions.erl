-module(functions).
-export(
    [
        greet/2, head/1, second/1, same/2,
        old_enough/1, right_age/1, wrong_age/1
    ]).

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
same(_, _) -> false.

old_enough(Age) when Age >= 16 -> true;
old_enough(_) -> false.

% ; is used as a guard separator to define && in Erlang
right_age(Age) when Age >= 16; Age < 104 -> true;
right_age(_) -> false.

% , is used as a guard separator to define || in Erlang
wrong_age(Age) when Age < 16, Age >= 104 -> true;
wrong_age(_) -> false.
