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

  def find_smallest(not_num, num_of_discs)
    print "Starts checking for number other than #{not_num}\n"
    smallest = num_of_discs+1
    a = @@board[0]
    b = @@board[1]
    c = @@board[2]
    if a[a.length-1].to_i < smallest && a[a.length-1].to_i != not_num.to_i && a[0] != nil
      smallest = a[a.length-1].to_i
      print "Smallest at a: #{smallest}\n" if $debug == 1
    end
    if b[b.length-1].to_i < smallest && b[0] != nil && b[b.length-1].to_i != not_num.to_i
      smallest = b[b.length-1].to_i
      print "Smallest at b: #{smallest}\n" if $debug == 1
    end
    if c[c.length-1].to_i < smallest && c[0] != nil && c[c.length-1].to_i != not_num.to_i
      smallest = c[c.length-1].to_i
      print "Smallest at c: #{smallest}\n" if $debug == 1
    end

    puts smallest if $debug == 1
    return smallest
  end



  def run(disc)

    a = @@board[0]
    b = @@board[1]
    c = @@board[2]

    puts "Moving disc #{disc}"

    if a.include?(disc)
      if a[a.length-1].to_i%2==0
        print "Even at a" if $debug == 1
        c.push(a.pop)
        add_move(disc, "A", "C") 
      else
        print "Odd at a" if $debug == 1
        b.push(a.pop)
        add_move(disc, "A", "B") 
      end
    elsif b.include?(disc)
      if b[b.length-1].to_i%2==0
        print "Even at b" if $debug == 1
        a.push(b.pop)
        add_move(disc, "B", "A") 
      else
        print "Odd at b" if $debug == 1
        c.push(b.pop)
        add_move(disc, "B", "C") 
      end
    elsif c.include?(disc)
      if c[c.length-1].to_i%2==0
        print "Even at c" if $debug == 1
        b.push(c.pop)
        add_move(disc, "C", "B") 
      else
        print "Odd at c" if $debug == 1
        a.push(c.pop)
        add_move(disc, "C", "A") 
      end
    end
      #find smallest
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

  def add_move(disc, from, to)
    line = "Moving #{disc} from #{from} to #{to}"
    @@moves << line
  end

  def print_moves
    @@moves.each do |move|
    puts move
    end
  end
end

def main
  num_of_discs = 3
  not_num = 0
  num_of_moves = 0
  win = false
  hanoi = Hanoi.new(num_of_discs)
  while win != true do
    hanoi.print_board
    disc = hanoi.find_smallest(not_num, num_of_discs)
    hanoi.run(disc)
    not_num = disc
    num_of_moves += 1
    win = hanoi.check_board(num_of_discs)
  end
=begin
  #try
    hanoi.print_board
    disc = hanoi.find_smallest(not_num, num_of_discs)
    hanoi.run(disc)
    not_num = disc
    win = hanoi.check_board(num_of_discs)
    hanoi.print_board
    disc = hanoi.find_smallest(not_num, num_of_discs)
    hanoi.run(disc)
    not_num = disc
    win = hanoi.check_board(num_of_discs)
    hanoi.print_board
    disc = hanoi.find_smallest(not_num, num_of_discs)
    hanoi.run(disc)
    not_num = disc
    win = hanoi.check_board(num_of_discs)
    hanoi.print_board
    disc = hanoi.find_smallest(not_num, num_of_discs)
    hanoi.run(disc)
    not_num = disc
    win = hanoi.check_board(num_of_discs)
    hanoi.print_board
    disc = hanoi.find_smallest(not_num, num_of_discs)
    hanoi.run(disc)
    not_num = disc
    win = hanoi.check_board(num_of_discs)
  #end
=end


  hanoi.print_board
  puts "Ended after #{num_of_moves} moves"
  hanoi.print_moves

end

main

