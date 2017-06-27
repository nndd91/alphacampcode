
def find_next_prime(num)
  @times =0
  while num < 99000
    @times += 1
    return "#{num} found in #{@times}" if is_prime(num)
    num += 1
  end

end

def is_prime(num)
  for k in (2..num/2)
    @times += 1
    return false if num%k == 0
  end
  true
end

p find_next_prime(4) #=> 5
p find_next_prime(6) #=> 7
p find_next_prime(8) #=> 11
p find_next_prime(30000)
