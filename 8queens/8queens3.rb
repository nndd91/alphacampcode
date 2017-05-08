#Third attempt at solving nqueen
@debug = 1
class Queen

	attr_accessor :n

	def initialize(num)
		@board = Array.new(num*num, ".")
		self.n = num
		p @board if @debug == 1
		Integer.n(num)
	end

	def can_place(queen, y)
		#Check row
		row = (-n..n)
		
		vertical = 

	def print_board
		@board.each_slice(n) do|row| 
			row.each { |cell| print cell," " }
			print "\n"
		end
	end


end

class Integer
	@@n = 0
	def self.n(num)
		@@n = num
	end

	def to_x
		x = numerator/@@n
	end

	def to_y
		y = numerator%@@n
	end

end

def main
	n = 4
	queen = Queen.new(n)
	queen.print_board
	4.to_x

	
end

main