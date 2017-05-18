class Computer

  components = [:keyboard, :mouse, :monitor, :cpu, :ram, :hdd]

  components.each do |method|

    define_method "#{method}" do
      #puts "In method #{method}"
      p instance_variable_get("@#{method}")
    end

    define_method "#{method}=" do |value|
      #puts "Assigning value to #{method}"
      instance_variable_set("@#{method}", value)
    end
  end


end



c = Computer.new
c.monitor = "Samsung"
c.monitor #=> "Samsung"
c.mouse
