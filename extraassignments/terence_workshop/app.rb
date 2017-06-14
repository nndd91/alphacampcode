require './alpha_camper.rb'
require './student.rb'
require './instructor.rb'
require './course_producer.rb'

daniel = Instructor.new("Daniel", 17, "instructor")
tim = CourseProducer.new("Tim", 30, "course producer")
nathan = Student.new("Nathan", 26, "student")

daniel.say_name
daniel.say_age
daniel.eat_lunch
tim.say_name
tim.say_age
tim.eat_lunch
nathan.say_name
nathan.say_age
nathan.eat_lunch
