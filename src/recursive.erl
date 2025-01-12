-module(recursive).
-export([
    fac/1, len/1,
    tail_fac/1, tail_len/1
    ]).

-spec(fac(integer()) -> integer()).
fac(0) -> 1;
fac(N) when N > 0 -> N * fac(N - 1).

-spec(len(list()) -> integer()).
len([]) -> 0;
len([_ | Tail]) -> 1 + len(Tail).

% Implementations leveraging tail recursion
-spec(tail_fac(integer()) -> integer()).
-spec(tail_fac(integer(), integer()) -> integer()).

tail_fac(N) -> tail_fac(N, 1).
tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N - 1, N * Acc).

-spec(tail_len(list()) -> integer()).
-spec(tail_len(list(), integer()) -> integer()).

tail_len(List) -> tail_len(List, 0).
tail_len([], Acc) -> Acc;
tail_len([_ | Tail], Acc) -> tail_len(Tail, Acc + 1).

