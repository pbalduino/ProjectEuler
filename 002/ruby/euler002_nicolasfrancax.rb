# Problem 2 - Even Fibonacci numbers
#
# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
#
# Source: http://projecteuler.net/problem=2

sum, before, now = 0, 1, 1
 
while now < 4_000_000
  before, now = now, now + before
  sum += now if now % 2 == 0
end
 
puts sum
