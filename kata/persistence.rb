def persistence(n)
  num_string = n.to_s.split('').map(&:to_i)
  no_of_times = 0

  while num_string.size > 1
    final_value = num_string.reduce(:*)
    num_string = final_value.to_s.split('').map(&:to_i)
    no_of_times += 1
  end

  no_of_times
end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
