=begin
3) Let's say we have the following array:
codes = [65, 66, 67, 68, 69, 70]
What ruby code do we have to call, to change this array into ["A", "B", "C", "D", "E", "F"]?
Hint! Look for ruby method called #chr.
=end

codes = [65, 66, 67, 68, 69, 70]

codes.each_with_index do |code, index|
  codes[index] = code.chr
end

p codes