def move_zeroes(nums)

numindex = 0
numofzeroes = 0

	nums.each do |n|
		if n != 0
			nums[numindex] = n
			numindex += 1
		else
			numofzeroes +=1
		end
	end

	(numindex..numindex+numofzeroes-1).each do |i|
		nums[i] = 0
	end


end
array = [0, 1, 4, 2, 0, 2]
move_zeroes(array)
p array
