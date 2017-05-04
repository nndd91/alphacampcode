# @param {Integer} num
# @return {Boolean}
def is_ugly(num)
  if num == 0
    return false
  end
  primefactors = [2,3,5]
  primefactors.each do |factor|
    while num%factor==0
      num /= factor
      #puts num
    end
  end
  return num == 1
end

input = "12 22 8 4 30 2 4 8 16 32 64 1 2 3 4 5 6 7 8 -21 -2147483648"
nums = input.split(" ")
p nums
nums.each do |num|
  print "The number ", num, " is ugly: ", "\n"
  puts is_ugly(num.to_i)
end
