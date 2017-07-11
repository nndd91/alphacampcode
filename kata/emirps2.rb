require 'prime'

def find_emirp(n)
  n < 13 ? [0, 0, 0] : EmirpList.new(n).result
end

class EmirpList
  def initialize(n)
    @n = n
  end

  def result
    emirps = emirp_list
    [emirps.length, emirps.last, emirps.inject(:+)]
  end

  private

  def emirp?(num)
    Prime.prime?(num) &&
      Prime.prime?(num.to_s.reverse.to_i) &&
      (num.to_s != num.to_s.reverse)
  end

  def emirp_list
    (13..@n).select do |num|
      emirp?(num)
    end
  end
end

p find_emirp(2)
p find_emirp(20)
p find_emirp(100)
p find_emirp(300)
