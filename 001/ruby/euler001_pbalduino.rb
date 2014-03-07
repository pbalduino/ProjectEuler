=begin
Problem 1 - Multiples of 3 and 5

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.

Source: http://projecteuler.net/problem=1
=end

puts (1..999).to_a.keep_if{|n| n % 3 == 0 || n % 3 == 5}.reduce(:+)