def find_even_index(arr)
  EvenIndex.new(arr).startloop
end

class EvenIndex
  def initialize(arr)
    @array = arr
  end

  def startloop
    @even_index = 0

    while @even_index < @array.size do
      if get_left_sum == get_right_sum
        return @even_index
      end

      @even_index += 1
    end
    -1
  end

  private

  def get_left_sum
    leftsum = 0
    for i in 0..@even_index-1
      leftsum += @array[i]
    end
    leftsum
  end

  def get_right_sum
    rightsum = 0
    for j in (@even_index+1)..@array.size-1
      rightsum += @array[j]
    end
    rightsum
  end
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0 #"Should pick the first index if more cases are valid")
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1
