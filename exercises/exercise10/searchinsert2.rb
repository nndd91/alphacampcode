def search_insert(nums, target)
  return 0 if target < nums.first
  return nums.size if target > nums.last

  index = nums.index { |n| n >= target }
end
