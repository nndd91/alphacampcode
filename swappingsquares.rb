def swapping(array)

  #Generating 1->n + n + n->1 pattern array
  length = array.length
  max_moves = ((length-1)/2)
  p max_moves

  num_of_moves_each_turn = []

  for i in (1..max_moves)
    num_of_moves_each_turn << i
  end
  num_of_moves_each_turn << max_moves

  for i in (0..max_moves-1)

    num_of_moves_each_turn << max_moves - i
  end

  p num_of_moves_each_turn

	#swap from one side to the other
  n = array.length-1

  #Move all x down
  turn = 0
  total_moves = 0

  num_of_moves_each_turn.each do |num_of_moves|

    #Setting up variables that refreshes/run on loop 1
    moves = num_of_moves
    turn += 1


    while moves > 0 do
      print "Turns: ", turn, "\n"#, " %2 =", turn%2, "\n"
      print "Moves left: ", moves, "\n"

      if turn%2 != 0
        #sweep left and swap X
        print "Checking X\n"
        for i in (0..n)

          if array[i]=="X" && array[i+1] == "-" && i+1<n+1
            swap(i, i+1, array)
            p array
            moves -= 1
            total_moves += 1
            print "Moves left", moves, "\n"
          elsif array[i]=="X" && array[i+2] == "-" && array[i+1] != "X" && i+1<n+1
            swap(i, i+2, array)
            p array
            moves -= 1
            total_moves += 1
            print "Moves left", moves, "\n"
          end
        end
      else
        #sweep right and swap Y
        print "Checking Y\n"
        for i in (0..n)

          #print "Start"
          j = n-i
          if array[j]=="O" && array[j-1] == "-" && j-1 > -1
            swap(j, j-1, array)
            p array
            moves -= 1
            total_moves += 1
            print "Moves left", moves, "\n"
          elsif array[j]=="O" && array[j-2] == "-" && array[j-1] != "O" && j-2>-1
            swap(j, j-2, array)
            p array
            moves -= 1
            total_moves += 1
            print "Moves left", moves, "\n"
          end
        end

      end

      check_array(array)
    end
  end
  print "Total Moves: ", total_moves, "\n"
end

def swap(a, b, array)
  temp = array[a]
  array[a] = array[b]
  array[b] = temp
  print "Swapping ", a, " and ", b, "\n"
end


def check_array(array)
  n = array.length-1
  mid = n/2
  #print "Mid is at ", mid, "\n"

  for i in (0..mid-1)
    if array[i] == "X" || array[i] == "-"
      puts "Not Sorted!"
      return false
    end
  end

  for i in ((mid+1)..n)
    if array[i] == "O" || array[i] == "-"
      puts "Not Sorted!"
      return false
    end
  end
  puts "Sorted!"
  true
end

input = "XXXXXX-OOOOOO"

array = input.chars
p array

swapping(array)
#check_array(array)

