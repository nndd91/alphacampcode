class Tictactoe

@@board = [[" ", " ", " "],
           [" ", " ", " "],
           [" ", " ", " "]]

def print_board
  for i in (0..2) do
    print " ", @@board[i][0], " | ", @@board[i][1], " | ", @@board[i][2], "\n"
    if i != 2
      print "-----------", "\n"
    end
  end
end

def player_move(player)
  print "Please enter player ", player, "\'s move: "
  input = gets
  xy = input.to_s.chars #Converting input into xy coordinates
  x = xy[0].to_i - 1
  y = xy[1].to_i - 1

  if x > 2 || x < 0 || y > 2 || y < 0 #Check if input is within the board
    puts "Invalid Move!"
    player_move(player)
  end

  if @@board[x][y] == "X" || @@board[x][y] == "O" #Check if input is on invalid cell
    puts "Invalid Move!"
    player_move(player)
  else
  @@board[(xy[0].to_i-1)][(xy[1].to_i-1)] = player #If all checks are ok, change cell to player move
  end
end

def check_win #8 winning pattern
  b = @@board
  win = ""
  for i in (0..2) do #Check for horizontal win
    if b[i][0] == b[i][1] && b[i][1] == b[i][2] && b[i][0] != " "
      win = b[i][0]
    end
  end
  for i in (0..2) do #Check for vertial win
    if b[0][i] == b[1][i] && b[1][i] == b[2][i] && b[0][i] != " "
      win = b[0][i]
    end
  end
  #Check for diagonal win
  if b[0][0] == b[1][1] && b[1][1] == b[2][2] && b[0][0] != " "
    win = b[0][0]
  end
  if b[0][2] == b[1][1] && b[1][1] == b[2][0] && b[0][2] != " "
    win = b[0][2]
  end
  return win
end

#p @@board

end

def main
  #Initial Variables and initialize the board
  ttt = Tictactoe.new
  win = ""
  turns = 1

  while win=="" do
    #Player X's turn
    print "Turn: ", turns, "\n"
    ttt.print_board
    ttt.player_move("X")
    win = ttt.check_win
    turns += 1

    #Player Y's turn
    if win==""
      if turns > 9
        break
      end
      print "Turn: ", turns, "\n"
      ttt.print_board
      ttt.player_move("O")
      win = ttt.check_win
      turns += 1
    end
  end

  ttt.print_board #If someone won or draw, print board and declare the resutls
  if win != ""
    print "Congratulation! Player ", win, " won!\n"
  else
    puts "It was a draw!"
  end

end

main



