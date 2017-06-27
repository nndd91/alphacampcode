def how_to_find_them(right_triangle)
  a = right_triangle.fetch(:a, 0)
  b = right_triangle.fetch(:b, 0)
  c = right_triangle.fetch(:c, 0)

  case
  when !right_triangle.has_key?(:a)
    a = (c*c - b*b)**0.5
    right_triangle[:a] = (a%1 == 0 ? a.to_i : a.round(3))
  when !right_triangle.has_key?(:b)
    b = (c*c - a*a)**0.5
    right_triangle[:b] = (b%1 == 0 ? b.to_i : b.round(3))
  when !right_triangle.has_key?(:c)
    c = (a*a + b*b)**0.5
    right_triangle[:c] = (c%1 == 0 ? c.to_i : c.round(3))
  end

  return right_triangle
end

p how_to_find_them({:a => 3, :b => 4}) #, {:a => 3, :b => 4, :c =>5})
p how_to_find_them({:a => 5, :c => 13}) #, {:a => 5, :c => 13, :b => 12})
p how_to_find_them({:b => 2, :c => 3}) #, {:b => 2, :c => 3, :a => 2.236})
p how_to_find_them({:a=>1.5489722016028642, :b=>8.089953689726176})
