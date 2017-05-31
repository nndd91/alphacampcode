def dirReduc(arr)
  dir_opposites = { 'NORTH' => 'SOUTH',
                    'SOUTH' => 'NORTH',
                    'EAST' => 'WEST',
                    'WEST' => 'EAST' }
  i = 0

  while i < arr.length
    if dir_opposites[arr[i]] == arr[i+1]
      arr.delete_at(i+1)
      arr.delete_at(i)
      i = 0
    else
      i += 1
    end
  end
  arr
end

a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
p dirReduc(a)#, ["WEST"])
puts
puts
u=["NORTH", "WEST", "SOUTH", "EAST"]
p dirReduc(u)#, ["NORTH", "WEST", "SOUTH", "EAST"])
