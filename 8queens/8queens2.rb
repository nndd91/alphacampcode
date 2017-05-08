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

  #Create board with all .
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

  def run

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

