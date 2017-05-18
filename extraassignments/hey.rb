class Hey

  def method_missing(str)
    puts "#{str.capitalize}?"
  end

end


h = Hey.new
h.hello #=> "Hello?"
h.no #=> "No?"
h.yes
h.something
h.hello
