class CourseProducer < AlphaCamper
  def initialize(name, age, role)
    super(name, age)
    @role = role
  end

  def eat_lunch
    puts "Eats lunch with team"
  end
end
