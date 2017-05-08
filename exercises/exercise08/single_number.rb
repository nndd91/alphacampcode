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

#Pavel Code
print "Pavel code\n"
#:itself is symbol 
#& lets you write a shorter version of block. group_by{ |a| a.itself } = group_by(&:itself)
#group by splits the array into its own group eg. 3 will go into key 3 with a 3 array
#values change a hash to just an array with values
#max_by - returns the maximum by the argument given
#first returns the first value

p nums.group_by(&:itself).values.max_by(&:size).first
