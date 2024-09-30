-module(fib_even_stream).

%% API
-export([sum_even_fib/0]).

% Main function to calculate the sum of even Fibonacci numbers
sum_even_fib() ->
    Sum = sum_even_fib_stream(fib_stream(), 0, 4000000),
    Sum.

% Function to generate an infinite Fibonacci stream
fib_stream() ->
    fun() -> fib_gen(1, 2) end.

fib_gen(A, B) ->
    {A, fun() -> fib_gen(B, A + B) end}.

% Function to sum even Fibonacci numbers up to a maximum value
sum_even_fib_stream(Stream, Acc, Max) ->
    {Value, NextStream} = Stream(),
    case Value of
    _ when Value > Max -> Acc;
    _ when Value rem 2 == 0 -> sum_even_fib_stream(NextStream, Acc + Value, Max);
    _ -> sum_even_fib_stream(NextStream, Acc, Max)
    end.