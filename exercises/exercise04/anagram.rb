=begin
Given two strings s and t, write a function to determine if t is an anagram of s.
For example,
s = "anagram", t = "nagaram", return true.
s = "rat", t = "car", return false.
Note:
You may assume the string contains only lowercase alphabets.
=end

def is_anagram(s, t)

  return false if s.length != t.length

  hashs = {}
  (0..s.length-1).each do |i|
    if hashs[s[i]] == nil
      hashs[s[i]] = 1
    else
      hashs[s[i]] += 1
    end
  end

  (0..t.length-1).each do |i|
    if hashs.include?(t[i]) && hashs[t[i]]>0
      hashs[t[i]] -= 1
    else
      return false
    end
  end
  true


end

p is_anagram("carrt", "rat")
p is_anagram("caac", "ccac")
p is_anagram("ab", "a")
