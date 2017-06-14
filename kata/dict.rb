
letter = "a"
string = ""
string << "{"
for i in (1..26) do
  string << "'#{letter}'=>#{i},"
  letter.succ!
end
final_string = string[0..-2] << "}"
print final_string

al = "A"
p al.to_i(26)
p al.succ.to_i(26)
