def remove_duplicates(nums)
  return nums.size unless nums.size > 1

  insert_at = 0

  for i in (1..nums.size-1)
    #print i
    if nums[i] != nums[insert_at]
      nums[insert_at+1] = nums[i]
      insert_at += 1
    end
  end

  return insert_at+1

end


#nums = [1, 1, 1, 2, 3, 4, 1, 2, 2, 3, 2, 2, 2, 3, 2, 2, 2, 1, 2].sort
#nums = [0,0,0,0]
nums = [1, 1, 2, 2, 3, 3, 3,3]
p nums
p remove_duplicates(nums)
