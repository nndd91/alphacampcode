def tower_of_hanoi(n)
	@left_pole = []
	@center_pole = []
	@right_pole = []

	for i in (0..n-1) do
		@center_pole.push(n-i)
	end

	p @center_pole

	def hanoi(l1, l2, l3)
	x = 

end

tower_of_hanoi(3)