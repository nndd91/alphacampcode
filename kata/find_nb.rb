
def find_nb(m)
    # your code
    total = 0
    i = 1
    while total < m do
      p total += (i)**3
      i += 1
    end

    if total == m
      return i-1
    else
      return -1
    end

end


p find_nb(3025)
p find_nb(4183059834009) #, 2022)
p find_nb(1)
p find_nb(24723578342962)#, -1)
p find_nb(135440716410000)#, 4824)
p find_nb(40539911473216)#, 3568)
