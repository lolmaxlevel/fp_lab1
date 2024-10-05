Терновский Илья Евгеньевич, P3332, вариант 2, 29
=====
# Even Fibonacci Numbers
[Euler problem 2](https://projecteuler.net/problem=2)

В данной задаче требуется найти сумму четных чисел фиббоначи не превышающих 4000000.

Решения описаны в директории [src/fib_even](https://github.com/lolmaxlevel/fp_lab1/tree/master/src/fib_even)

Простейшее решение на python [fib_even.py](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/fib_even/fib_even.py) в дополнительных комментариях не нуждается.

Решение с использованием хвостовой рекурсии [fib_even_monolith_tail](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/fib_even/fib_even_monolith_tail.erl). Самое очевидное монолитное решение, в дополнительных комментариях, как мне кажется, не нуждается.

Решение с использованием обычной рекурсии [fib_even_monolith_recursion](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/fib_even/fib_even_monolith_recursion.erl). Немного переделанное решение с использованием хвостовой рекурсии, для того что бы она перестала быть хвостовой. Все остальное идентичное.

Решение с использьованием модульного решения [fib_even_module](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/fib_even/fib_even_module.erl). Из интересного filter и foldl, функции фильтрации и свертывания, работают в ерланге классическим образом. Ну и добавление нового элемента в список [A | Acc]

Решение с использованием стримов(бесконечных последовательностей), которые вычисляются лениво [fib_even_stream](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/fib_even/fib_even_stream.erl). Из интересного очевидно стримы, в эрланге работают примерно как в хаскеле, на сколько помню, то есть при каждом вызове возвращают значения и анонимную функцию для вычисления следющего элемента.

# Distinct Powers
[Euler problem 29](https://projecteuler.net/problem=29)

В данной задаче требуется найти все уникальные числа полученные путем возведения в степень (2,100) чисел (2,100)

Решения описаны в директории [src/distinct_powers](https://github.com/lolmaxlevel/fp_lab1/tree/master/src/distinct_powers)

Простейшее решение на python [distinct_powers.py](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/distinct_powers/distinct_powers.py) в дополнительных комментариях не нуждается.

Решение с использованием модульной реализцаии [distinct_powers.erl](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/distinct_powers/distinct_powers.erl). Редьюсер не совсем явный(реализуется встроенной функицией), свертка в данной задаче не требуется, поэтому она отсутствует.

Решение с использованием map [distinct_powers_map](https://github.com/lolmaxlevel/fp_lab1/blob/master/src/distinct_powers/distinct_powers_map.erl). Решение схоже с модульным решением, но для генерации используется функция map.
