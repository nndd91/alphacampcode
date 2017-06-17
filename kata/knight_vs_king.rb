def knight_vs_king(knight_position, king_position)
  ChessGame.new(knight_position, king_position).calculate
end

class ChessGame
  # Winning Formula
  KNIGHT_WIN = [ 6, 10, 15, 17 ].freeze
  KING_WIN = [ 1, 7, 8, 9 ].freeze

  def initialize(knight_position, king_position)
    @knight = ChessPiece.new(knight_position)
    @king = ChessPiece.new(king_position)
  end

  def calculate
    return "None" if none_win?
    return "Knight" if knight_win?
    return "King" if king_win?
    "None"
  end

  private

  def none_win?
    # Invalid position. input outside board
    xy_array = [ @knight.x, @knight.y, @king.x, @king.y ]
    xy_array.each do |coord|
      return true if coord < 1 || coord > 8
    end

    # Winning move is across board
    return true if @king.x - @knight.x < 0
  end

  def knight_win?
    tiles_apart = (@knight.position - @king.position).abs
    KNIGHT_WIN.include?(tiles_apart)
  end

  def king_win?
    tiles_apart = (@king.position - @knight.position).abs
    KING_WIN.include?(tiles_apart)
  end
end

class ChessPiece
  attr_reader :position, :x, :y

  def initialize(position_array)
    @position = get_position(position_array)
  end

  private

  def get_position(position_array)
    @x = position_array[1].ord - "@".ord
    @y = position_array[0]

    position = @x + ((@y-1) * 8)
  end
end

p knight_vs_king([4, "C"], [6, "D"]) == "Knight"
p knight_vs_king([2, "A"], [3, "C"]) == "Knight"
p knight_vs_king([7, "B"], [6, "C"]) == "King"
p knight_vs_king([5, "D"], [6, "D"]) == "King"
p knight_vs_king([2, "F"], [6, "B"]) == "None"
p knight_vs_king([0, "F"], [6, "B"]) == "None"
p knight_vs_king([4, "H"], [5, "B"]) == "None"
