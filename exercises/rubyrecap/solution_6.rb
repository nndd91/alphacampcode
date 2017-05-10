def positive(num)
  if (num > 0 && num < 6)
    print "I am between 1 and 5"
  elsif (num > 5 && num < 11)
    print "I am between 6 and 10"
  else
    print "I am more than 10"
  end
  puts
end

positive(7)
positive(-1)
