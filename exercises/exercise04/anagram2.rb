def is_anagram(s, t)

  return false if s.length != t.length

  (0..t.length-1).each do |i|
    if !(s.include?(t[i])) && t[i] != " "
      return false
    end
    s.delete!(t[i])
    p s
  end
  true

end

p is_anagram("caac", "ccac")
p is_anagram("anagram","nagaram")
