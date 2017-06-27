def step(step, start_search, end_search)
  FirstPrimePair.new(step, start_search, end_search).run
end

class FirstPrimePair
  def initialize(step, start_search, end_search)
    @step = step
    @start_search = start_search
    @end_search = end_search
  end

  def run
    prime1 = find_next_prime(@start_search-1, @end_search)
    while prime1 + @step < @end_search
      if is_prime(prime1 + @step)
        return [prime1, prime1+@step]
      end

      prime1 = find_next_prime(prime1, @end_search)
    end
    nil
  end

  private

  def find_next_prime(first, last)
    for i in (first+1..last)
      prime = true
      for j in (2..i/2)
        prime = false if i%j == 0
      end
      return i if prime
    end
    return nil
  end

  def is_prime(num)
    for k in (2..num/2)
      return false if num%k == 0
    end
    true
  end
end

print "should be [101, 103] -> "
p step(2,100,110)
print "should be [103, 107] -> "
p step(4,100,110)
print "should be [101, 107] -> "
p step(6,100,110)
print "should be [359, 367] -> "
p step(8,300,400)
print "should be [307, 317] -> "
p step(10,300,400)
