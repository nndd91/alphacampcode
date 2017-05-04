
def is_power_of_two(n)	
  if Math.log2(n)%1 == 0 && n > 0 #O(1)
  	return true 
  end
  false
end

input = "12 22 8 4 30 2 4 8 16 32 64"
array = input.split(" ")
p array
array.each do |a|
  print "For the number ", a, "\n"
  puts is_power_of_two(a.to_i)
end