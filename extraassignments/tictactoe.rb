
class Tictactoe
@@debug = 0
#Generate board and make all value empty
@@board = [[" ", " ", " "],
           [" ", " ", " "],
           [" ", " ", " "]]

#Method to print out the board in a 2D format
def print_board
  for i in (0..2) do
    print " ", @@board[i][0], " | ", @@board[i][1], " | ", @@board[i][2], "\n"
    if i != 2
      print "-----------", "\n"
    end
  end
end

#Gets input from player to make a move on the board
def player_move(player)
  print "Please enter player ", player, "\'s move: "
  input = gets
  xy = input.to_s.chars #Converting input into xy coordinates
  x = xy[0].to_i - 1
  y = xy[1].to_i - 1

  if xy.length < 2 #Check if they entered enough coordinates
    puts "Invalid Move!"
    player_move(player)

  elsif x > 2 || x < 0 || y > 2 || y < 0 #Check if input is within the board, also reject if the user input alphabets or other symbols
    puts "Invalid Move!"
    player_move(player)

  elsif @@board[x][y] == "X" || @@board[x][y] == "O" #Check if input is on invalid cell
    puts "Invalid Move!"
    player_move(player)
  else
  @@board[(xy[0].to_i-1)][(xy[1].to_i-1)] = player #If all checks are ok, change cell to player move
  end
end

#Script for the ai
def ai_move(ai)
  @b=@@board
  @ai_sym = ai
  if ai == "O"
    @pl_sym = "X"
  else
    @pl_sym = "O"
  end

  #Check if player is going to win and block
  def block_or_win(pl_sym, ai_sym)
    print "Running block\n" if @@debug == 1
    #For each row and colum, check for horizonal player count then block if count == 2
    for i in (0..2) do
      row_count = 0
      col_count = 0
      for j in (0..2) do
        row_count += 1 if @b[i][j] == pl_sym #+1 if first cell is pl_sym
        col_count += 1 if @b[j][i] == pl_sym
      end

      #If player has 2 in a row, check for the empty space and block him
      if row_count == 2
        for j in (0..2) do
          if @b[i][j] == " "
            @b[i][j] = ai_sym
            return true
          end
        end
      end

      #If player has 2 in a column, check for the empty space and block him
      if col_count == 2
        for j in (0..2) do
          if @b[j][i] == " "
            @b[j][i] = ai_sym
            return true
          end
        end
      end
    end

    #Counting player moves in diagonals
    diag_count = 0
    diag2_count = 0
    for i in (0..2) do
      diag_count += 1 if @b[i][i] == pl_sym
      diag2_count += 1 if @b[i][2-i] == pl_sym
    end

    #Checking diagonal and blocking if player alraedy has 2
    if diag_count == 2
      for i in (0..2) do
        if @b[i][i] == " "
          @b[i][i] = ai_sym
          return true
        end
      end
    end

    #Checking second diagonal and blocking if player alraedy has 2
    if diag2_count == 2
      for i in (0..2) do
        if @b[i][2-i] == " "
          @b[i][2-i] = ai_sym
          return true
        end
      end
    end

    return false
  end

  #If no block, make a random move
  def random_move

    #generate a list of possible move
    possible_move = []
    for i in (0..8)
      x = i_x(i)
      y = i_y(i)
      if @b[x][y] == " "
        possible_move << i
      end
      p possible_move if @@debug == 1
    end

    ran_num = rand(0..possible_move.length-1)
    print "Random Number: #{ran_num}\n" if @@debug == 1
    move = possible_move[ran_num]

    x = i_x(move)
    y = i_y(move)
    print "Move: #{move}, X is #{x}, Y is #{y}\n" if @@debug == 1
    @b[x][y] = @ai_sym
  end

  def i_x(i) #convert i to xy
    x = i/3
    return x
  end

  def i_y(i)
    y = i%3
    return y
  end

  if !block_or_win(@ai_sym, @ai_sym) #Check if can win
    if !block_or_win(@pl_sym, @ai_sym) #Check if needs to block
      print "Not Blocking, making Random move" if @@debug == 1
      random_move #Else makes a random move
    end
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

def menu

  def print_manual #Print instruction for user
    print <<EOF
Enter your moves in the following format: xy

11 | 12 | 13
-------------
21 | 22 | 23
-------------
31 | 32 | 33

EOF
  end

#Start of menu by printing welcome message
print <<EOF
Hello there! Welcome to Tictactoe!
What would you like to do today?

  1. Player Vs AI
  2. Player Vs Player

EOF
  print "Please enter your choice: "
  input = gets.chomp.to_i
  case input
  when 1 #Player VS AI
    #Script for choosing a side, either x or o
    def choose_side
      print "Select your symbol(x or o): "
      input = gets.chomp.upcase
      #print input
      case input
      when "X"
        print "Player vs AI\n"
        print_manual
        playervai(input)
      when "O"
        print "Player vs AI\n"
        print_manual
        playervai(input)
      else
        print "There is only X and O! Choose again!\n"
        choose_side
      end
    end
    choose_side
  when 2 #Player VS player
    print "Player vs Player\n"
    system('cls')
    print_manual
    playervplayer
  else
    print "Please enter a valid input!!\n"
    menu
  end
end

def playervplayer
  #Initial Variables and initialize the board
  ttt = Tictactoe.new
  win = ""
  turns = 1

  while win=="" do
    if turns > 9
        break
    end
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

def playervai(player)
#Initial Variables and initialize the board
  ttt = Tictactoe.new
  win = ""
  turns = 1
  if player == "X"
    ai = "O"
  else
    ai = "X"
    print "Turn: ", turns, "\n"
    ttt.ai_move(ai)
    ttt.print_board
    win = ttt.check_win
    turns += 1
  end


  while win=="" do
    #Player X's turn
    print "Turn: ", turns, "\n"
    #ttt.print_board
    ttt.player_move(player)
    win = ttt.check_win
    turns += 1

    #Player Y's turn
    if win==""
      if turns > 9
        break
      end
      print "Turn: ", turns, "\n"
      ttt.ai_move(ai)
      ttt.print_board
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

menu



