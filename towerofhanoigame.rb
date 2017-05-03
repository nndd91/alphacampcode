$debug = 0

class Hanoi
  attr_accessor :board, :pole1, :pole2

  @@board = [[],[],[]]
  @@moves = []
  p @@board if $debug == 1
  @@turns = 0


  def initialize(n)
    a = @@board[0]
    b = @@board[1]
    c = @@board[2]

    for i in (0..n-1)
      a << n-i
    end
  end

  def move

    a = @@board[0]
    b = @@board[1]
    c = @@board[2]

    print "Enter your move: "

    input = gets.to_s.upcase.chomp.chars
    p input if $debug == 1

    if input[1]=="A"
      topole = a
    elsif input[1]=="B"
      topole = b
    elsif input[1]=="C"
      topole = c
    else
      puts "Invalid topole!!"
      topole=""
      self.move
    end
    puts topole if $debug == 1

    if input[0]=="A"
      frompole = a
    elsif input[0]=="B"
      frompole = b
    elsif input[0]=="C"
      frompole = c
    else
      puts "Invalid frompole!!"
      frompole=""
      self.move
    end
    puts frompole if $debug == 1

=begin
    if a[a.length-1]==input[0].to_i
      puts "found at A" if $debug == 1
      frompole = a

    elsif b[b.length-1]==input[0].to_i
      puts "found at B" if $debug == 1
      frompole = b

    elsif c[c.length-1]==input[0].to_i
      puts "found at C" if $debug == 1
      frompole = c
    end
=end

    if topole.empty? || frompole[frompole.length-1].to_i < topole[topole.length-1]
      temp = frompole.pop
      topole.push(temp)
      move = "Turn #{@@turns}: Moving Disc #{temp} from #{input[0]} to #{input[1]}."
      @@moves << move
      p @@moves if $debug==1
      @@turns += 1
      return
    else
      puts "Invalid move!"
      self.move
    end


  end

  def check_board(n)
    b = @@board[1]
    for i in (0..n-1)
      if b[i].to_i != n-i
        #print b[i], " vs ", n
        return false
      end
    end
    true
  end

  def print_board
    tallest_tower = 0
    a = @@board[0]
    b = @@board[1]
    c = @@board[2]


    if a.length > b.length
      tallest_tower = a.length
    else
      tallest_tower = b.length
      p tallest_tower if $debug == 1
    end

    tallest_tower = c.length if tallest_tower < c.length

    for i in (0..tallest_tower)
      index = tallest_tower-i
      print " "
      if a[index] == nil
        print " "
      else
        print a[index]
      end
      print "       "
      if b[index] == nil
        print " "
      else
        print b[index]
      end
      print "       "
      if c[index] == nil
        print " "
      else
        print c[index]
      end
      print "\n"
    end
    print "---     ---     ---\n"
    print " A       B       C\n"


  end

  def print_moves
    @@moves.each do |move|
    puts move
    end
  end
end

def main
  num_of_discs = 7
  win = false
  hanoi = Hanoi.new(num_of_discs)
  while win != true do
    hanoi.print_board
    hanoi.move
    win = hanoi.check_board(num_of_discs)
  end
  hanoi.print_board
  puts "Congratulations!"
  hanoi.print_moves

end

main

