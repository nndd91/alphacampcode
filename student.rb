class Student
  attr_accessor :name, :gender, :age, :track
  @@Students = []
  p @@Students

  def initialize(name, gender, age, track)
    self.name = name
    self.gender = gender
    self.age = age
    self.track = track
    @@Students << self
  end

  def self.print_list
    p @@Students
  end

  def self.average_age
    total_age = 0
    @@Students.each do |student|
      total_age += student.age
    end
    print "Average age is: ", (total_age/@@Students.length), "\n"
  end

  def self.male_female
    total_male = 0
    total_female = 0
    @@Students.each do |student|
      if student.gender == "M"
        total_male += 1
      else
        total_female += 1
      end
    end
    print "Male to Female ratio is: ", (total_male), ":", total_female, "\n"

  end

end

#make to female ratio
#average age


agnes = Student.new("Agnes", "F", 26, "product design")
eason = Student.new("Eason", "M", 31, "marketing")
zach = Student.new("Zach", "M", 28, "web development")
peter = Student.new("Peter", "M", 30, "iOS development")

p agnes
p agnes.name
Student.print_list
Student.average_age
Student.male_female
