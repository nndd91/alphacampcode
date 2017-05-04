$debug = 0

class Hanoi

  @@board = [[],[],[]]
  @@moves = []
  p @@board if $debug == 1

  def initialize(n) #Initialise 
    a = @@board[0]

    for i in (0..n-1)
      a << (n-i).to_i
    end
  end

  def find_smallest(not_num, num_of_discs) #Find the smallest number at the top excluding the not_num
    print "Starts checking for number other than #{not_num}\n"
    #Make smallest larger than any discs
    smallest = num_of_discs+1
    a = @@board[0]
    b = @@board[1]
    c = @@board[2]

    if a[0] != nil &&
       a[a.length-1] < smallest &&  
       a[a.length-1] != not_num
      smallest = a[a.length-1]
      print "Smallest at a: #{smallest}\n" if $debug == 1
    end
    if b[0] != nil &&
       b[b.length-1] < smallest &&
       b[b.length-1] != not_num
      smallest = b[b.length-1]
      print "Smallest at b: #{smallest}\n" if $debug == 1
    end
    if c[0] != nil && 
       c[c.length-1] < smallest && 
       c[c.length-1] != not_num
      smallest = c[c.length-1]
      print "Smallest at c: #{smallest}\n" if $debug == 1
    end

    puts smallest if $debug == 1
    return smallest
  end

  def run(disc) #Check for location of disc and move it depending on the pole it is located at

    a = @@board[0]
    b = @@board[1]
    c = @@board[2]

    puts "Moving disc #{disc}"

    if a.include?(disc)
      if a[a.length-1]%2==0
        print "Even at a" if $debug == 1
        c.push(a.pop)
        add_move(disc, "A", "C") 
      else
        print "Odd at a" if $debug == 1
        b.push(a.pop)
        add_move(disc, "A", "B") 
      end
    elsif b.include?(disc)
      if b[b.length-1]%2==0
        print "Even at b" if $debug == 1
        a.push(b.pop)
        add_move(disc, "B", "A") 
      else
        print "Odd at b" if $debug == 1
        c.push(b.pop)
        add_move(disc, "B", "C") 
      end
    elsif c.include?(disc)
      if c[c.length-1]%2==0
        print "Even at c" if $debug == 1
        b.push(c.pop)
        add_move(disc, "C", "B") 
      else
        print "Odd at c" if $debug == 1
        a.push(c.pop)
        add_move(disc, "C", "A") 
      end
    end
  end

  def check_board(n) #Check pole B to see if its the end
    b = @@board[1]
    for i in (0..n-1)
      if b[i] != n-i
        #print b[i], " vs ", n
        return false
      end
    end
    true
  end

  def print_board #Function to print out the hanoi board
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

  def add_move(disc, from, to) #Add each moves to a list to be printed later
    line = "Moving #{disc} from #{from} to #{to}"
    @@moves << line
  end

  def print_moves #Print out the list of moves saved.
    @@moves.each do |move|
    puts move
    end
  end
end

def main
  #Initialize some variables
  num_of_discs = 99
  not_num = 0
  num_of_moves = 0
  win = false
  hanoi = Hanoi.new(num_of_discs)

  #running of main program
  while win != true do
    hanoi.print_board
    disc = hanoi.find_smallest(not_num, num_of_discs)
    hanoi.run(disc)
    not_num = disc
    num_of_moves += 1
    win = hanoi.check_board(num_of_discs)
  end

  #Adding the finishing
  hanoi.print_board
  puts "Ended after #{num_of_moves} moves"
  hanoi.print_moves

end

#Run main
main

