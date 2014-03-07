# http://projecteuler.net/problem=2

sum, before, now = 0, 1, 1
 
while now < 4_000_000
  before, now = now, now + before
  sum += now if now % 2 == 0
end
 
puts sum
