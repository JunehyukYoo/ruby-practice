# fibonacci.rb
# Different implementations of the nth number of the Fibonacci sequence

GOLDEN = (1 + Math.sqrt(5)) / 2

# Standard recursion
def fib_rec(n)
  raise "Invalid Input" if n < 0
  return n if n < 2
  fib_rec(n-1) + fib_rec(n-2)
end

# Recursion with explicit memoization
def fib_rec_mem(n)
  cache = Hash.new
  cache[0] = 0
  cache[1] = 1
  fib_rec_mem_helper(n, cache)
end

def fib_rec_mem_helper(n, cache)
  return n if n < 2
  a = -1
  b = -1
  cache.key?(n-1) ? a = cache[n-1] : a = fib_rec_mem_helper(n-1, cache)
  cache.key?(n-2) ? b = cache[n-2] : a = fib_rec_mem_helper(n-2, cache)
  cache[n] = a + b
  a + b
end

# Closed form solution of recurrence from original recursive function
def fib_closed(n)
  raise "Invalid Input" if n < 0
  (GOLDEN**n - (1-GOLDEN)**n)/Math.sqrt(5)
end

# Iterative
def fib_iter(n)
  raise "Invalid Input" if n < 0
  return n if n < 2

  prev2 = 0
  prev1 = 1
  for i in 2..n do
    temp = prev1 + prev2
    prev2 = prev1
    prev1 = temp
  end
  prev1
end

# Testing functions with runtime
def test_fib(n, callback)
  t1 = Time.now
  a = callback.call(n)
  t2 = Time.now
  delta = t2-t1
  puts "Time to #{callback.name}(#{n}) recursively is #{delta} seconds where F(n) = #{a}."
end

# Tests all different implementations
def test_all(n)
  test_fib(n, method(:fib_iter))
  test_fib(n, method(:fib_closed))
  test_fib(n, method(:fib_rec_mem))
  test_fib(n, method(:fib_rec))
end

test_all(40)