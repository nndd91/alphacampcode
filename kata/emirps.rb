require 'prime'

def find_emirp(n)

  return [0, 0, 0] if n < 13

  primes =
    (13..n).select do |num|
      Prime.prime?(num) && Prime.prime?(num.to_s.reverse.to_i) && (num.to_s != num.to_s.reverse)
    end

  [primes.length, primes.last, primes.inject(:+)]
end

p find_emirp(2)
p find_emirp(20)
p find_emirp(100)
p find_emirp(300)
