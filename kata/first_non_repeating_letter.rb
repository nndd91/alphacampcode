def  first_non_repeating_letter(s)
  letters_hash = {}
  s.each_char do |letter|
    letter.downcase!
    if letters_hash[letter].nil?
      letters_hash[letter] = 1
    else
      letters_hash[letter] += 1
    end
  end
  s.each_char do |letter|
    if letters_hash[letter.downcase] == 1
      return letter
    end
  end
  ""
end



p first_non_repeating_letter('a')# 'a')
p first_non_repeating_letter('stress')# 't')
p first_non_repeating_letter('moonmen')# 'e')
p first_non_repeating_letter('')# '')
