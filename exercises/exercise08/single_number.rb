=begin
Given an array of integers, every element appears three times except for
one, which appears exactly once. Find that single one.
Note:
Your algorithm should have a linear runtime complexity. Could you implement
it without using extra memory?
=end
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)

	for i in (0..nums.length)
		if nums.count(nums[i]) == 1
			return nums[i]
		end
	end
end

nums = [1,1,1,2,2,2,6,6,6,3,3,3,4,4,4,5,8,8,8]

p single_number(nums)