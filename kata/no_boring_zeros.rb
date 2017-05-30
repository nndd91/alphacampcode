def no_boring_zeros(num)
  # Place code - get rid of zeros - receive bacon
  num = num.to_s
  i = num.length - 1
  zero_index = num.length - 1

  while num[i] == '0'
    zero_index -= 1
    i -= 1
  end
  num.slice(0, zero_index + 1).to_i
end

p no_boring_zeros(1450)#, 145)
p no_boring_zeros(960000)#, 96)
p no_boring_zeros(1050)#, 105)
p no_boring_zeros(-1050)#, -105)
p no_boring_zeros(0)#, 0
