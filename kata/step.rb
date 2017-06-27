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
    @breakloop = false
    @prime1 = find_next_prime(@start_search-1, @end_search)
    @prime2 = find_next_prime(@prime1, @end_search)
    while @breakloop == false
      #puts "Starting loop with #{@prime1}, #{@prime2}"

      if (@prime2 - @prime1) == @step
        #puts "TRUE!!!"
        @breakloop = true
        @primepair = [@prime1, @prime2]
      end

      @prime2 = find_next_prime(@prime2, @end_search)
      #puts "Prime2 is now #{@prime2}"
      if @prime2.nil?
        @prime1 = find_next_prime(@prime1, @end_search)
        @prime2 = find_next_prime(@prime1, @end_search)
      end

      if @prime1.nil?
        @breakloop = true
        @primepair = nil
      end
    end
    return @primepair
  end

  private

  def find_next_prime(first, last)
    primepair = []
    for i in (first+1..last)
      prime = true
      for j in (2..i/2)
        prime = false if i%j == 0
      end
      return i if prime
    end
    return nil
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
