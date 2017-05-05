=begin

The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no 
two queens attack each other.

Given an integer n, return all distinct solutions to the n-queens puzzle.

Each solution contains a distinct board configuration of the n-queens' placement,
where 'Q' and '.' both indicate a queen and an empty space respectively.

2 boards -> 1 keep track
keep track of all invalid moves
keep track of previous queen
brute force!!

Variables
N for boardsize and number of queens


methods:
generateboard -> convert all to .
place queen -> select a dot

=end

$debug = 1

class Nqueen
	attr_accessor :x, :y

	def initialize(x, y)
		self.x = x
		self.y = y
	end
end

class Board
	attr_accessor :n

	def initialize(n)
		self.n = n
		p self.n
		$board = Array.new(n) {
			Array.new(n) { "." }
		}
		$tempboard = Array.new(n) {
			Array.new(n) { "." }
		}
		p $board if $debug == 1
		p $tempboard if $debug == 1
	end

	def add_queen(queen, x, y)

		def check_within(x, y)
			#puts "value of n is #{n}"
			if (x >= 0) && (x < n) && (y >= 0) && (y < n)
				#puts "X at #{x} and Y at #{y} is within!"
				return true
			else
				return false
			end
		end

		def add_x(x, y)
			#Changing rows
			for i in (0..(self.n*2))
				puts "i is #{i}"
				x_cur = x - n + i
				puts "x_cur is #{x_cur}"
				puts "y is #{y}"
				if check_within(x_cur, y)
					puts "Within!"
					if $tempboard[x_cur][y] == "."
						puts "Changing to X!"
						$tempboard[x_cur][y] = "X"
						p $tempboard
					end
				end
			end
			#Changing y
			for i in (0..(self.n*2))
				puts "i is #{i}"
				y_cur = y - n + i
				puts "x is #{x}"
				puts "y_cur is #{y_cur}"
				if check_within(x, y_cur)
					puts "Within!"
					if $tempboard[x][y_cur] == "."
						puts "Changing to X!"
						$tempboard[x][y_cur] = "X"
						p $tempboard
					end
				end
			end
			#changing diagonal
			for i in (0..(self.n*2))
				x_cur = x - n + i 
				y_cur = y - n + i
				if check_within(x_cur, y_cur)
					if $tempboard[x_cur][y_cur] == "."
						$tempboard[x_cur][y_cur] = "X"
						p $tempboard
					end
				end
			end	
			#changing diagonal
			for i in (0..(self.n*2))
				x_cur = x + n - i 
				y_cur = y - n + i
				if check_within(x_cur, y_cur)
					if $tempboard[x_cur][y_cur] == "."
						$tempboard[x_cur][y_cur] = "X"
						p $tempboard
					end
				end
			end			

		end


		if $board[x][y] != "X"
			queen = Nqueen.new(x, y)
			$board[x][y] = "Q"
			$tempboard[x][y] = "Q"
			add_x(x, y)





=begin
			#Add invalid
			for i in (0..(self.n*2))
				#puts "#{i} and #{n}" if $debug == 1
				x_cur = (x-n+i)
				for j in (0..(self.n*2))
					y_cur = (y-n+j)
					puts "x_cur is #{x_cur}" if $debug == 1
					puts "y_cur is #{y_cur}" if $debug == 1
					#Changing all rows to "X"
					if check_within(x_cur, y) 
						puts "y_cur is #{y_cur}"
						current_point = $tempboard[x_cur][y]
						if current_point == "."
							puts "Running Change Row to X at #{x_cur}, #{y_cur}"
							current_point = "X"
							
						end
					end
					#Changing all columns to "X"				
					#if check_within(x, y_cur)
					#	if ($tempboard[x][y_cur] == ".")
					#		puts "Running Change Row to Y at #{x_cur}, #{y_cur}" if $debug == 1
					#		$tempboard[x][y_cur] = "X"
					#	end
					#end
				end

			end
=end

			print_board
		else
			puts "Invalid position" if $debug == 1
		end
	end

	def print_board
		puts "Board"
		$board.each do |i|
			i.each do |j|
				print j
			end
			puts
		end
	
		puts "Temp Board"
		$tempboard.each do |i|
			i.each do |j|
				print j
			end
			puts
		end
	end

	def check_board(n)
		num_of_queens = 0
		$board.each do |i|
			i.count("Q")
		end

		if num_of_queens > n-1
			return true
		else
			return false
		end
	end


end

def main
	#Initialize Variables
	n = 4
	board = Board.new(n)
	board.add_queen($board.push, 2, 2)
	board.print_board
	$board[1] = ["Q", "Q", "Q" , "."]
	p board.check_board(n)
	#Run

end

main

