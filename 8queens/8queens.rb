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

$debug = 0

class Board
	attr_accessor :n

	def initialize(n)
		self.n = n
		p self.n if $debug == 1
		$board = Array.new(n) {
			Array.new(n) { "." }
		}
		$tempboard = Array.new(n) {
			Array.new(n) { "." }
		}
		p $board if $debug == 1
		p $tempboard if $debug == 1
	end

	def find_dot_and_add
		print "n is #{n}"
		$run = 0
		for i in (0..n-1)
			add_queen(0, i)
			#Go through each row
			x = 1
			def add_on_row(x)
				(0..n-1).each do |j|
					$run += 1
					if $tempboard[x][j] == "."
						add_queen(x, j)
					end
					
					if x < n - 1
						x += 1
						add_on_row(x)
					end
				end
			end 
			add_on_row(x)
			check_board(n)
			print_board
			refresh_board
		end	
	end
	$run = 0

	def add_queen(x, y)

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
				puts "i is #{i}" if $debug == 1
				x_cur = x - n + i
				puts "x_cur is #{x_cur}" if $debug == 1
				puts "y is #{y}" if $debug == 1
				if check_within(x_cur, y)
					puts "Within!" if $debug == 1
					if $tempboard[x_cur][y] == "."
						puts "Changing to X!" if $debug == 1
						$tempboard[x_cur][y] = "X"
						p $tempboard  if $debug == 1
					end
				end
			end
			#Changing y
			for i in (0..(self.n*2))
				y_cur = y - n + i
				if check_within(x, y_cur)
					if $tempboard[x][y_cur] == "."
						$tempboard[x][y_cur] = "X"
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
					end
				end
			end			

		end

		if $board[x][y] != "X"
			$board[x][y] = "Q"
			$tempboard[x][y] = "Q"
			add_x(x, y)
			#print_board
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

	def print_winboard(board)
		board.each do |i|
			i.each do |j|
				print j
			end
			puts
		end
	end

	def check_board(n)
		puts "Checking board"
		num_of_queens = 0
		$board.each do |i|
			num_of_queens += i.count("Q")
		end

		if num_of_queens > n-1
			puts "Copying board"
			p $board
			winningboard = []
			for i in (0..n-1)
				winningboard[i] = $board[i].dup
			end
			$winningboard << winningboard
			return true
		else
			return false
		end
	end

	def refresh_board
		puts "Refreshing Board"
		puts "Board"
		for i in (0..$board.length-1)
			for j in (0..$board[i].length-1)
				$board[i][j] = "."
			end
		end
	
		puts "Temp Board"
		for i in (0..$board.length-1)
			for j in (0..$board[i].length-1)
				$tempboard[i][j] = "."
			end
		end
	end

end

def main
	#Initialize Variables
	n = 4
	$winningboard = []
	board = Board.new(n)
	#board.find_dot_and_add
	board.try(0, 0)
	#board.print_board
	board.check_board(n)
	#p $winningboard
	boardnum = 1
	$winningboard.each do |i|
		puts "Board #{boardnum}"
		board.print_winboard(i)
		boardnum += 1
	end
	puts "Number of solutions: #{$winningboard.length}"
	puts "Run: #{$run}"
	#Run

end

main

