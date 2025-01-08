-module(functions).
-export(
    [
        greet/2, head/1, second/1, same/2,
        old_enough/1, right_age/1, wrong_age/1,
        compare_with_true/2, compare_with_match/2,
        insert/2, beach/1
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

% Sample functions a, b, and c
a() -> "a".
b() -> "b".
c() -> "c".

% Function showcasing if true pattern matching used as else
compare_with_true(X, Y) ->
    if
        X > Y -> a();
        X < Y -> b();
        true  -> c()
    end.

% Function showcasing if with explicit exhaustive pattern matching
compare_with_match(X, Y) ->
    if
        X > Y -> a();
        X < Y -> b();
        X == Y -> c()
    end.

insert(X,[]) ->
    [X];
insert(X,Set) ->
    case lists:member(X,Set) of
        true  -> Set;
        false -> [X|Set]
    end.

% case {A,B} of
%     Pattern Guards -> ...
% end.
beach(Temperature) ->
    case Temperature of
        {celsius, N} when N >= 20, N =< 45 ->
            'favorable';
        {kelvin, N} when N >= 293, N =< 318 ->
            'scientifically favorable';
        {fahrenheit, N} when N >= 68, N =< 113 ->
            'favorable in the US';
        _ ->
            'avoid beach'
    end.
