def tower_of_hanoi(n)
	@left_pole = []
	@center_pole = []
	@right_pole = []

	for i in (0..n-1) do
		@center_pole.push(n-i)
	end

	p @center_pole

	def hanoi(l1, l2, l3)
	x = 

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


  end

end

tower_of_hanoi(3)