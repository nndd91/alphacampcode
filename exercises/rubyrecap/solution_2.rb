=begin
2) Define a Hash with keys "a", "b", "c", "d", and values ["avocado"], ["bean", "banana"], ["carrot", "cherry", "clementine"] and ["date", "dragon fruit"] respectively.
Then:
a) print the hash to the console
b) find a way to print the total number of fruits. It should give you number 9.
c) remove all "c" fruits
d) print the hash again
=end

# Define Hash
@vegs = {}
@vegs["a"] = ["avocado"]
@vegs["b"] = ["bean", "banana"]
@vegs["c"] = ["carrot", "cherry", "clementine"]
@vegs["d"] = ["date", "dragon fruit"]

p @vegs
puts

# Part A
def print_hash
  @vegs.each do |k, v|
    v.each do |el|
      print el, ' '
    end
  end
  puts
end

# Part B
def count_fruits
  total = 0
  @vegs.each do |k, v|
    total += v.count
  end
  puts total
end

def remove_fruits(c)
  @vegs[c].each do |el|
    @vegs[c].pop
  end
end

# Part D

print_hash
count_fruits
remove_fruits('c')
print_hash
