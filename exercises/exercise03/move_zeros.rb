=begin
Given an array nums, write a function to move all 0's to the end of it while maintaining the
relative order of the non-zero elements.
For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12,
0, 0].
Note:
1. You must do this in-place without making a copy of the array.
2. Minimize the total number of operations.
=end

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

def move_zeroes(nums)

n = nums.length-1

  for i in (0..n)
    if nums[i] == 0
      nums[i] = "X"
      nums << 0
    end
  end
  nums.delete("X")

end
array = [0, 1, 4, 2, 0, 2]
move_zeroes(array)
p array
