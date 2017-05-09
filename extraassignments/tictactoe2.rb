#Code taught by Pavel

#array with 9 values
arr = []
for i in (0..8)
	arr << "-"
end

p arr

class Game
	def initialize
		@empty = "-"
		@current_player = "X"
		@other_player = "O"

		@board = Array.new(9, @empty)
end

- %s() turns foo into a symbol (:foo)

case status
when :draw
     print_draw()
     break
when :winner
     print_winner()
     break

STDIN.gets #read any key after game finished

#Game.new.start()
#Game.new.play()
#Game.new.run()

alias play start
alias run start

a = 2
b = 6
a,b = b,a #swapping of elements

def read_move

print "Move #{@current_player} (1-9): "
STDIN.gets.to_i

return false if !position.between?(1, @board.length)

return false if @board[position -1] != @empty

@board[position - 1] = player

true

def status
     return :draw if !@board.include? @empty
     return :winner if winning_positions.any? { |values| values.uniq == [@current_player] } #check with array of the current player symbol
     return :player

end

def winning_positons
     [
     #rows
     @board.values_at(0, 1, 2),