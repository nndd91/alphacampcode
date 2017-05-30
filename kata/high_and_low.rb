def high_and_low(numbers)
  #your code here
  numbers = numbers.split(" ").map(&:to_i)
  arr = []
  arr = numbers.max.to_s
  arr += " #{numbers.min}"
  return arr
end

p high_and_low("4 5 29 54 4 0 -214 542 -64 1 -3 6 -6")
