def fizzbuzz(n)
	return "fizzbuzz" if n%15 == 0
	return "buzz" if n%5 == 0
	return "fizz" if n%3 == 0
	return n
end

(1..50).each do |i|
	puts fizzbuzz(i)
end

