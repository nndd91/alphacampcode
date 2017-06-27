def sieve_of_erathosthenes(last)
  @sieve_hash = {}
  for i in (2..last**0.5) do
    if !@sieve_hash.has_key?(i)
      (i+i..last).step(i).each do |j|
        @sieve_hash[j] = false
      end
    end
  end
  @sieve_hash
end

p sieve_of_erathosthenes(100)
# sieve_of_erathosthenes(11, 100000).each do |k, v|
#   print "#{k}, " if v
# end
