def find_employees_role(name)
  names = name.split(" ")
  $employees.each do |employee|
    if employee['first_name'] == names[0] && employee['last_name'] == names[1]
      return employee['role']
    end
  end
  return "Does not work here!"
end

$employees = [ {'first_name'=> "Dipper", 'last_name'=> "Pines", 'role'=> "Boss"}, {'first_name'=> "Anna", 'last_name'=> "Bell", 'role'=> "Admin"} ]

p find_employees_role("Dipper Pines")# "Boss!")
p find_employees_role("Morty Smith")# "Does not work here!")
p find_employees_role("Anna Bell")# "Admin")

