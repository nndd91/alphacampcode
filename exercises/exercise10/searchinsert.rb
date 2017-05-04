=begin
Given a sorted array and a target value, return the index if the target is found. If not, return the index where it
would be if it were inserted in order.
You may assume no duplicates in the array.
Here are few examples.
[1,3,5,6], 5 → 2
[1,3,5,6], 2 → 1
[1,3,5,6], 7 → 4
[1,3,5,6], 0 → 0
=end
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  num_index = nums.length
  for i in (0..nums.length-1)
    if nums[i] == target || nums[i] > target
      num_index = i
      break
    end
  end
  return num_index

end


#Time Complexity = O(n)

p search_insert([1,3,5,6], 5) #=> 2
p search_insert([1,3,5,6], 2) #=> 1
p search_insert([1,3,5,6], 7) #=> 4
p search_insert([1,3,5,6], 0) #=> 0
