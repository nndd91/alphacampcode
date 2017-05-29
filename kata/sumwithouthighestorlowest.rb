

def sum_array(arr)
  if arr.kind_of?(Array) && arr.length > 2
    arr = arr.flatten.sort
    arr.pop
    arr.shift
    total = 0
    arr.each do |el|
      total += el
    end
    return total
  else
    return 0
  end
end


arr2 = [1,2].class
p arr2 == Array
p sum_array([1,2,3,[3,4]]) #-> 8
p sum_array([6, 0, 1, 10, 10]) #-> 17
p sum_array([-6, -20, -1, -10, -12]) #-> -28
p sum_array([-6, 20, -1, 10, -12]) #-> 3
p sum_array([6, 2, 1, 8, 10]) #-> 16

