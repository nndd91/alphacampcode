=begin
Say you have an array for which the ith element is the price of a given stock on
day i.
Design an algorithm to find the maximum profit. You may complete as many
transactions as you like (ie, buy one and sell one share of the stock multiple
times). However, you may not engage in multiple transactions at the same time
(ie, you must sell the stock before you buy again).
=end
# @param {Integer[]} prices
# @return {Integer}

#Solution to just get highest price and lowest price
def max_profit(prices)

	max_cur = 0
	min_price_so_far = prices[0]

	#p prices

	(0..prices.length-1).each do |i|
		#puts "Currently at #{i}"
		#puts "Max: #{max_cur}"
		#puts "Min: #{min_price_so_far}"
		if prices[i] - min_price_so_far > max_cur
			max_cur = prices[i] - min_price_so_far
			#puts "Max price so far #{max_cur}"
		elsif prices[i] < min_price_so_far
			min_price_so_far = prices[i]
			#puts "Min price so far is #{min_price_so_far}"
		end
	end

	return max_cur
end

=begin
	min_price = 2**32
	max_price = 0
	min_price_index = 0
	max_price_index = 0

	for i in (0..prices.length-1)
		if max_price < prices[i]
			max_price = prices[i]
			max_price_index = i
		elsif prices[i] < min_price
			min_price = prices[i]
			min_price_index = i
		end
	end

	diff = max_price - min_price

	return diff
=end

prices = [7,1,5,3,6,4]

p max_profit(prices)