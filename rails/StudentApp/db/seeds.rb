# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create(firstname: "Francisco", lastname: "Chang",   age: 25, grade: "A", gender: "male", playing_sport: false)
Student.create(firstname: "Roland",    lastname: "Mendel",  age: 22, grade: "B", gender: "male", playing_sport: true)
Student.create(firstname: "Helen",     lastname: "Bennett", age: 19, grade: "D", gender: "female", playing_sport: true)
Student.create(firstname: "Maria",     lastname: "Anders",  age: 18, grade: "A", gender: "female", playing_sport: false)
Student.create(firstname: "Giovanni",  lastname: "Rovelli", age: 20, grade: "D", gender: "male", playing_sport: true)
Student.create(firstname: "Giovanni",  lastname: "Max", age: 20, grade: "D", gender: "male", playing_sport: true)
Student.create(firstname: "Giovanni",  lastname: "Nathan", age: 20, grade: "D", gender: "male", playing_sport: true)


Student.create(firstname: "John", lastname: "Good", age: 20, grade: "C", gender: "male", playing_sport: true)