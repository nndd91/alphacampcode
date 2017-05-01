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
  xy = input.to_s.chars
  if @@board[(xy[0].to_i-1)][(xy[1].to_i-1)] == "X" || @@board[(xy[0].to_i-1)][(xy[1].to_i-1)] == "O"
    puts "Invalid Move!"
    player_move(player)
  else
  @@board[(xy[0].to_i-1)][(xy[1].to_i-1)] = player
  end
end

def check_win #8 winning pattern
  b = @@board
  win = ""
  for i in (0..2) do
    if b[i][0] == b[i][1] && b[i][1] == b[i][2] && b[i][0] != " "
      win = b[i][0]
    end
  end
  for i in (0..2) do
    if b[0][i] == b[1][i] && b[1][i] == b[2][i] && b[0][i] != " "
      win = b[0][i]
    end
  end
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
  win = ""
  ttt = Tictactoe.new

  while win=="" do
    ttt.print_board
    ttt.player_move("X")
    win = ttt.check_win
    if win==""
      ttt.print_board
      ttt.player_move("O")
      win = ttt.check_win
    end
  end

  ttt.print_board
  print "Congratulation! Player ", win, " won!"

end

main



