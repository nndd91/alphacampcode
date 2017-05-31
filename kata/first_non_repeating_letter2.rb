def  first_non_repeating_letter(s)
  letter = s.chars.find { |letter| s.downcase.count(letter) == 1 } || ""
end



p first_non_repeating_letter('a')# 'a')
p first_non_repeating_letter('stress')# 't')
p first_non_repeating_letter('moonmen')# 'e')
p first_non_repeating_letter('')# '')
