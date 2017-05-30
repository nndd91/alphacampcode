def no_boring_zeros(num)
  num.to_s.sub(/0*$/, '').to_i
end

p no_boring_zeros(1050)
