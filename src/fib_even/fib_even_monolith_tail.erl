-module(fib_even_monolith_tail).

%% API
-export([sum_even_fib/0]).

% Главная функция, которая вызывает рекурсивную функцию с начальными значениями
sum_even_fib() ->
    sum_even_fib(1, 2, 0).

% Рекурсивная функция для вычисления суммы четных чисел Фибоначчи
sum_even_fib(A, _, Sum) when A > 4000000 ->
    Sum;
sum_even_fib(A, B, Sum) ->
    NewSum = case A rem 2 of
        0 -> Sum + A;
        _ -> Sum
    end,
    sum_even_fib(B, A + B, NewSum).