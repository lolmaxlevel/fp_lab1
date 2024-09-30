-module(fib_even_module).

%% API
-export([sum_even_fib/0]).

% Main function to calculate the sum of even Fibonacci numbers
sum_even_fib() ->
    FibonacciSequence = generate_fib(4000000),
    EvenFibonacci = lists:filter(fun is_even/1, FibonacciSequence),
    Sum = lists:foldl(fun(A, Acc) -> A + Acc end, 0, EvenFibonacci),
    Sum.

% Function to generate Fibonacci sequence up to a maximum value
generate_fib(Max) ->
    generate_fib(1, 2, Max, []).

generate_fib(A, _, Max, Acc) when A > Max ->
    lists:reverse(Acc);

generate_fib(A, B, Max, Acc) ->
    generate_fib(B, A + B, Max, [A | Acc]).

% Function to check if a number is even
is_even(N) ->
    N rem 2 == 0.