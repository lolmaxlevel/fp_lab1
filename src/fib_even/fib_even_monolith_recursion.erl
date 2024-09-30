-module(fib_even_monolith_recursion).

%% API
-export([sum_even_fib/0]).

% Main function to start the recursion
sum_even_fib() ->
    Sum = sum_even_fib(1, 2),
    Sum.

% Recursive function to sum even Fibonacci numbers
sum_even_fib(A, _) when A > 4000000 ->
    0;
sum_even_fib(A, B) ->
    NewSum = case A rem 2 of
                 0 -> A;
                 true -> 0
             end,
    NewSum + sum_even_fib(B, A + B).