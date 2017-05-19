class Student < ApplicationRecord
   require 'faker'
   
    validates :age, numericality: {
        greater_than_or_equal_to: 15
    }

    enum grade: {
        "A": 5,
        "B": 4,
        "C": 3,
        "D": 2,
        "E": 1,
        "F": 0
    }

    enum gender: {
        "male": 1,
        "female": 2
    } 

    scope :playing_sports, -> {where(playing_sport: true)}
    scope :males, -> {where(gender: "male")}

    # scope :females, lambda.new do
    #   where(gender: "female")
    # end

    

    def self.female_playing_sports
      students = self.where(gender: "female").where(playing_sport: true)
      return students.length
    end
    

    def self.average_grades
      students = Student.all
      total_grade = 0

      total_grade = students.sum { |x| self.grades[x.grade] }

      average_grade = self.grades.key(total_grade/students.length)

      #Student.group(:grade).average(:grade)

    end

    def self.age_of_best_student
      Student.order('grade DESC, age DESC').first.age
    end

    def self.count_f
      return self.where(grade: "F").length
    end
    
    def self.plays_sport
      students = self.where(playing_sport: true)
      students.each { |x| puts x.firstname + " " + x.lastname }

      return students
    end

    def self.Male(value)
      students = self.where(gender: "male")
      x = students[value]
      print x.firstname," ", x.lastname, ", ", x.age 
    end

    def self.Female(value)
      students = self.where(gender: "female")
      x = students[value]
      print x.firstname," ", x.lastname, ", ", x.age 
    end
    
    def self.grade_list
      # gradesF = self.where(grade: "F").length
      grades = self.all.group(:grade).count

      grades.each do |k, v|
        print k, " = ", v, "\n"
      end
      #Student.group(:grade).count
    end

    def self.average_grades_detailed
      females = self.where(gender: "female")
      males = self.where(gender: "male")

      female = (females.sum { |x| self.grades[x.grade]})/females.length.to_f
      male = (males.sum { |x| self.grades[x.grade]})/males.length.to_f
   
      puts "Male = average #{'%.1f' % male}"
      puts "Female = average #{'%.1f' % female}"

      #Student.group(:gender).average(:grade)
 
    end

    def self.duplicates 
      
      # duplicatesfirst = self.group(:firstname).having("count(firstname) > 1").pluck(:firstname)
      # duplicatesfirst.each do |x|
      #   self.where(firstname: x).each do |y|
      #     print y.firstname, " ", y.lastname, "\n"
      #   end
      # end

      duplicates = self.where("count(firstname) > 1")
      duplicates.each do |x|
        print x.firstname, " ", x.lastname, " \n"
      end
      
    end

    def self.populate(value)
      for i in (1..value)
        Student.create(firstname: Faker::Name.first_name,  lastname: Faker::Name.last_name, age: Faker::Number.between(10, 50), grade: self.grades.key(Faker::Number.between(0, 5)), gender: self.genders.key(Faker::Number.between(1, 2)), playing_sport: Faker::Boolean.boolean)
      end
      
    end

    def self.print_all
      self.all.each do |x|
        print x.firstname, " ", x.lastname, " : ", x.age, " : ", x.grade, " : ", x.gender, " : ", x.playing_sport, "\n"
      end
    end
    
    def self.long_lastname

      longlastname = self.where("length(lastname) > 14")
      # longlastname = self.group(:lastname).having('count(lastname) > 14 ').pluck(:lastname)
      # longlastname.each do |x|
      #   self.where(lastname: x).each do |y|
      #     print y.firstname, " ", y.lastname, "\n"
      #   end
      # end
      longlastname.each do |x|
        print x.firstname, " ", x.lastname, "\n"
      end

      class << self #All function below are appended with self. Defining all the methods in singleton class
        
        def function 
          
        end
        
      end


    end
    



    
    
    


end