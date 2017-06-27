require 'prime'

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
    prime1 = find_next_prime(@start_search)
    while prime1 + @step < @end_search
      if Prime.prime?(prime1 + @step)
        return [prime1, prime1+@step]
      end

      prime1 = find_next_prime(prime1 + 1)
      return nil if prime1.nil?
    end
  end

  private

  def find_next_prime(num)
    while num < @end_search
      return num if Prime.prime?(num)
      num += 1
    end
    nil
  end
end

print "should be nil -> "
p step(2, 4900, 4919)
print "should be nil -> "
p step(7, 4900, 4919)
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
print "should be nil -> "
p step(11, 30000, 100000)
print "should be [10000139, 10000141] -> "
p step(2, 10000000, 11000000)
print "should be [104087, 104089] -> "
p step(2, 104000, 105000)

