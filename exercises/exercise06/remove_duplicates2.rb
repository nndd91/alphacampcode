def remove_duplicates(nums)
  if nums == []
    return 0
  else
    nums.uniq!
  end
  return nums.length
end


#nums = [1, 1, 1, 2, 3, 4, 1, 2, 2, 3, 2, 2, 2, 3, 2, 2, 2, 1, 2].sort
nums = [1,1,2]
p nums

print remove_duplicates(nums)

#nums.uniq.length
