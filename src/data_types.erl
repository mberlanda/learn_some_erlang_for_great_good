-module(data_types).
-export([
    numbers/0,
    variables/0,
    atoms/0,
    boolean_operations/0,
    tuples/0,
    lists/0,
    list_comprehensions/0,
    bit_syntax/0
]).

% Numbers showcase
% Demonstrates basic arithmetic operations and base conversions
numbers() ->
    [
        2 + 15,        % Addition
        49 * 100,      % Multiplication
        5 / 2,         % Division (floating-point result)
        5 div 2,       % Integer division
        5 rem 2,       % Modulo (remainder)
        2#101010,      % Binary to decimal conversion
        16#AE          % Hexadecimal to decimal conversion
    ].

% Variables showcase
% Demonstrates variable assignment and immutability
variables() ->
    One = 1,            % Assigning a value to a variable
    Two = One + One,    % Using a variable in expressions
    _Ignored = 42,      % Using an underscore for ignored values
    [One, Two, _Ignored].

% Atoms showcase
% Demonstrates the use of atoms as constants
atoms() ->
    [cat,               % Simple atom
     'Quoted Atom'].    % Atom with spaces or special characters

% Boolean operations
% Demonstrates logical and comparison operations
boolean_operations() ->
    [
        true and false, % Logical AND
        true or false,  % Logical OR
        5 =:= 5.0,      % Exact equality (type-sensitive)
        5 == 5.0        % Value equality (type-insensitive)
    ].

% Tuples showcase
% Demonstrates the creation and pattern matching of tuples
tuples() ->
    Point = {4, 5},     % Creating a tuple
    {X, Y} = Point,     % Pattern matching to extract values
    [{Point, X, Y}].

% Lists showcase
% Demonstrates basic list operations and pattern matching
lists() ->
    List = [1, 2, 3],           % Creating a list
    NewList = [0 | List],       % Adding an element to the head of a list
    [List,                     % Original list
     hd(List),                 % Head of the list (first element)
     tl(List),                 % Tail of the list (remaining elements)
     NewList].                 % Modified list

% List comprehensions
% Demonstrates generating new lists from existing lists
list_comprehensions() ->
    List = [1, 2, 3, 4],        % Original list
    [X * 2 || X <- List].       % Doubling each element in the list

% Bit syntax showcase
% Demonstrates binary data representation and pattern matching
bit_syntax() ->
    Pixel = <<240, 154, 41>>,    % Creating a binary value
    <<R:8, G:8, B:8>> = Pixel,   % Pattern matching to extract RGB values
    [{Pixel, R, G, B}].
