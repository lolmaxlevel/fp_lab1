-module(fib_even_monolith).

%% API
-export([]).

-export([sum_even_fib/0]).

% Главная функция, которая вызывает рекурсивную функцию с начальными значениями
sum_even_fib() ->
    sum_even_fib(1, 2, 0).

% Рекурсивная функция для вычисления суммы четных чисел Фибоначчи
sum_even_fib(A, B, Sum) when A > 4000000 ->
    Sum;
sum_even_fib(A, B, Sum) ->
    NewSum = if
        A rem 2 == 0 -> Sum + A;
        true -> Sum
    end,
    sum_even_fib(B, A + B, NewSum).