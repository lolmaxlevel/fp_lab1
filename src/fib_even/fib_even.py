def fib(a, b, sum):
    if a > 4000000:
        return sum
    if a % 2 == 0:
        sum += a
    return fib(b, a + b, sum)

print(fib(1, 1, 0))