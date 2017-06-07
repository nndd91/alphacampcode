
letter = "a"
string = ""
string << "{"
for i in (1..26) do
  string << "'#{letter}'=>#{i},"
  letter.succ!
end
final_string = string[0..-2] << "}"
print final_string

