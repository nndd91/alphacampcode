def dirReduc(arr)

  dir_hash = {"NORTH" => "SOUTH",
                    "SOUTH" => "NORTH",
                    "EAST" => "WEST",
                    "WEST" => "EAST"}
  i = 0
  j = 0
  cleared = 0
  while cleared == 0
    arr.each_with_index do |direction, i|
      arr.each_with_index do |direction2, j|
        if direction2 == dir_hash[direction]
          puts "Found Pair at #{i} and #{j}"
          p arr
          arr.delete_at(j)
          p arr
          arr.delete_at(i)
          p arr
          break
        end
      end
    end
    cleared = 1
  end
end

a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
p dirReduc(a)#, ["WEST"])
u=["NORTH", "WEST", "SOUTH", "EAST"]
p dirReduc(u)#, ["NORTH", "WEST", "SOUTH", "EAST"])
