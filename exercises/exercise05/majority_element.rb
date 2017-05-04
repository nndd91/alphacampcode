=begin
Given an array of size n, find the majority element. The majority
element is the element that appears more than ⌊ n/2 ⌋ times.
You may assume that the array is non-empty and the majority element
always exist in the array.
=end

# @param {Integer[]} nums
# @return {Integer}

def majority_element(nums)
	n = nums.length
	nums_hash = {}
	(0..n-1).each do |i|
		if nums_hash[nums[i]] == nil
			nums_hash[nums[i]] = 1
		else
			nums_hash[nums[i]] += 1
		end
	end
=begin
	nums_hash.each do |k,v|
		if v > n/2
			puts k
		end
	end
=end
	return nums_hash.max_by{ |k, v| v}[0]
end

nums = [1, 1, 1, 2, 3, 4, 1, 2, 2, 3, 2, 2, 2, 3, 2, 2, 2, 1, 2]
p majority_element(nums)
