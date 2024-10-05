Терновский Илья Евгеньевич, P3332, вариант 2, 29
=====
# Even Fibonacci Numbers
[Euler problem 2](https://projecteuler.net/problem=2)

В данной задаче требуется найти сумму четных чисел фиббоначи не превышающих 4000000.

Решения описаны в директории [src/fib_even](https://github.com/lolmaxlevel/fp_lab1/tree/master/src/fib_even)

Простейшее решение на python [fib_even.py](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/fib_even/fib_even.py) в дополнительных комментариях не нуждается.
```python
def fib(a, b, sum):
    if a > 4000000:
        return sum
    if a % 2 == 0:
        sum += a
    return fib(b, a + b, sum)

print(fib(1, 1, 0))
```

Решение с использованием хвостовой рекурсии [fib_even_monolith_tail](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/fib_even/fib_even_monolith_tail.erl). Самое очевидное монолитное решение, в дополнительных комментариях, как мне кажется, не нуждается.
```erlang
sum_even_fib() ->
    sum_even_fib(1, 2, 0).
sum_even_fib(A, _, Sum) when A > 4000000 ->
    Sum;
sum_even_fib(A, B, Sum) ->
    NewSum = case A rem 2 of
        0 -> Sum + A;
        _ -> Sum
    end,
    sum_even_fib(B, A + B, NewSum).
```

Решение с использованием обычной рекурсии [fib_even_monolith_recursion](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/fib_even/fib_even_monolith_recursion.erl). Немного переделанное решение с использованием хвостовой рекурсии, для того что бы она перестала быть хвостовой. Все остальное идентичное.

```erlang
sum_even_fib() ->
    Sum = sum_even_fib(1, 2),
    Sum.

% Recursive function to sum even Fibonacci numbers
sum_even_fib(A, _) when A > 4000000 ->
    0;
sum_even_fib(A, B) ->
    NewSum = case A rem 2 of
                 0 -> A;
                 _ -> 0
             end,
    NewSum + sum_even_fib(B, A + B).
```

Решение с использьованием модульного решения [fib_even_module](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/fib_even/fib_even_module.erl). Из интересного filter и foldl, функции фильтрации и свертывания, работают в ерланге классическим образом. Ну и добавление нового элемента в список [A | Acc]
```erlang
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
```
Решение с использованием стримов(бесконечных последовательностей), которые вычисляются лениво [fib_even_stream](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/fib_even/fib_even_stream.erl). Из интересного очевидно стримы, в эрланге работают примерно как в хаскеле, на сколько помню, то есть при каждом вызове возвращают значения и анонимную функцию для вычисления следющего элемента.

```erlang
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
```

# Distinct Powers
[Euler problem 29](https://projecteuler.net/problem=29)

В данной задаче требуется найти все уникальные числа полученные путем возведения в степень (2,100) чисел (2,100)

Решения описаны в директории [src/distinct_powers](https://github.com/lolmaxlevel/fp_lab1/tree/master/src/distinct_powers)

Простейшее решение на python [distinct_powers.py](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/distinct_powers/distinct_powers.py) в дополнительных комментариях не нуждается.
```python
print(len(set([i**k for i in range(2, 101) for k in range(2, 101)])))
```

Решение с использованием модульной реализцаии [distinct_powers.erl](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/distinct_powers/distinct_powers.erl). Редьюсер не совсем явный(реализуется встроенной функицией), свертка в данной задаче не требуется, поэтому она отсутствует.

```erlang
count_distinct_terms() ->
    Terms = generate_powers(),
    % это можно считать редьюсером
    UniqueTerms = filter_unique(Terms),
    Count = length(UniqueTerms),
    Count.

generate_powers() ->
  lists:flatten([[math:pow(X, Y), math:pow(Y, X)] || X <- lists:seq(2,100), Y <- lists:seq(2,100)]).

filter_unique(Terms) ->
    lists:usort(Terms).
```

Решение с использованием map [distinct_powers_map](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/distinct_powers/distinct_powers_map.erl). Решение схоже с модульным решением, но для генерации используется функция map.

```erlang
count_distinct_terms() ->
    Terms = generate_powers(),
    UniqueTerms = filter_unique(Terms),
    Count = length(UniqueTerms),
    Count.

% Function to generate powers using map
generate_powers() ->
    lists:flatten(lists:map(fun(A) ->
        lists:map(fun(B) ->
            math:pow(A, B)
        end, lists:seq(2, 100))
    end, lists:seq(2, 100))).

% Function to filter unique terms
filter_unique(Terms) ->
    lists:usort(Terms).
```


