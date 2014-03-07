# http://projecteuler.net/problem=1
  
sum = 0

(0..999).each do |n|
  if n % 3 == 0 || n % 5 == 0
    sum += n
  end
end

puts sum
