=begin
Given a sorted array, remove the duplicates in place such that each element appear only once
and return the new length.
Do not allocate extra space for another array, you must do this in place with constant memory.
For example,
Given input array nums = [1,1,2],
Your function should return length = 2, with the first two elements of nums being 1 and 2
respectively. It doesn't matter what you leave beyond the new length.
=end

# @param {Integer[]} nums
# @return {Integer}
=begin
def remove_duplicates(nums)
	nums.each do |num|
		puts "Running .each"
		for i in (0..nums.length-1)
			if nums[i] == num
				nums.delete_at(i)
				p nums
			end
		end
	end
	p nums

end
=end

def remove_duplicates(nums)
	uniqueindex = 0
	uniquenum = 0

	if nums == []
		return 0
	end

	(0..nums.length-1).each do |i|
		if nums[i] == 0 && uniquenum == 0
			uniquenum = nums[i]
			nums[uniqueindex] = uniquenum
			uniqueindex += 1
			uniquenum = -1
		end

		if nums[i] != uniquenum
			uniquenum = nums[i]
			nums[uniqueindex] = uniquenum
			uniqueindex += 1
		end
	end

	n = nums.length

	(0..(nums.length-uniqueindex)).each do |i|
		nums.delete_at(n-i)
	end
	p nums
	nums.length

end


def remove_duplicates2(nums)
	return nums.uniq.length
end


#nums = [1, 1, 1, 2, 3, 4, 1, 2, 2, 3, 2, 2, 2, 3, 2, 2, 2, 1, 2].sort
nums = [0,0,0,0]
p nums
p remove_duplicates(nums)

print remove_duplicates2(nums)

#nums.uniq.length
