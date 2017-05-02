def swapping(array)

  length = array.length
  n = ((length-1)/2)
  p n
  left_array = []
  for i in (1..n)
    left_array << i
  end

  left_array << n

  for i in (0..n-1)

    left_array << n - i
  end

  p left_array

	#swap from one side to the other
  n = array.length-1
	emptyindex = array.index("-")
  p emptyindex

  #Move all x down
  swapping = "X"
  turn = 0
  total_moves = 0
  left_array.each do |k|
  moves = k
  turn += 1


    #sweep left
    while moves > 0 do
      print "Turns: ", turn, "\n"#, " %2 =", turn%2, "\n"
      print "Moves left: ", moves, "\n"
      #print "Start check\n"
      if turn%2 != 0
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
        print "Checking Y\n"
      #sweep right
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

input = "XXX-OOO"
input3 = "XX-OO"
input3 = "OOO-XXX"

array = input.chars
p array

swapping(array)
#check_array(array)

