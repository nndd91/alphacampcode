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
    while @start_search != "No more primes"
      primepair = find_next_prime(@start_search, @end_search)
      return nil if primepair[1] == "No more primes"
      return primepair if (primepair[1] - primepair[0]) == @step
      @start_search = primepair[1]
    end
  end

  private

  def find_next_prime(first, last)
    primepair = []
    for i in (first..last)
      prime = true
      for j in (2..i/2)
        prime = false if i%j == 0
      end
      primepair.push(i) if prime
      puts "Prime pair is #{primepair}" if prime
      return primepair if primepair.size == 2
    end
    return [nil, "No more primes"]
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
