=begin
  4) Having a following array:
chars = ["a", "K", "r", "e", "V", "L", "C"]
Iterate over the array, or use map method, to print following:
irb(main):046:0> ... your code ...
- a is lowercase
- K is uppercase
- r is lowercase
- e is lowercase
- V is uppercase
- L is uppercase
- C is uppercase
=> nil
=end

chars = ["a", "K", "r", "e", "V", "L", "C"]

chars.each do |char|
  if char == char.upcase
    print char, " is uppercase\n"
  else
    print char, " is lowercase\n"
  end
end
