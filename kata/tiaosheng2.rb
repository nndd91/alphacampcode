def tiaosheng(failed_counter)
  KidJumper.new(failed_counter).calculate_jumps
end

class KidJumper
  def initialize(failed_counter)
    @time = 0
    @jumps = 0
    @fails = failed_counter
  end

  def calculate_jumps
    while (@time < 60)
      @fails.include?(@jumps) ? (@time += 4) : (@time += 1)
      @jumps += 1 unless (@time > 60)
    end
    @jumps
  end
end


# p tiaosheng([]) == 60
# p tiaosheng([12, 23, 45]) == 51
# p tiaosheng([17]) == 57
# p tiaosheng([10, 20, 30, 40]) == 48
# p tiaosheng([10, 20, 30, 40, 58]) == 48
p tiaosheng([10, 20, 30, 40, 47, 60]) == 47
p tiaosheng([1,2,3,4,5,6,7,8,9,10]) == 30
