#number of moves
length = 9
n = ((length-1)/2)
p n
left_array = []
for i in (1..n)
  left_array << i
end

left_array << n

for i in (0..n-1)

  left_array << n - i
end

p left_array

turns = 2

p turns%2 != 0
p turns
