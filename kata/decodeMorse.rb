def decodeMorse(morseCode)
  Morse.new(morseCode).humanwords
end

class Morse
  attr_accessor :humanwords

  def initialize(morseCode)
    @humanwords = morseCode.lstrip.split("   ").map do |word|
      word.split(" ").map { |letter| MORSE_CODE[letter].upcase }.join("")
    end.join(" ")
  end

end

morse_dict = {
  "a" => ".-",
  "b" => "-...",
  "c" => "-.-.",
  "d" => "-..",
  "e" => ".",
  "f" => "..-.",
  "g" => "--.",
  "h" => "....",
  "i" => "..",
  "j" => ".---",
  "k" => "-.-",
  "l" => ".-..",
  "m" => "--",
  "n" => "-.",
  "o" => "---",
  "p" => ".--.",
  "q" => "--.-",
  "r" => ".-.",
  "s" => "...",
  "t" => "-",
  "u" => "..-",
  "v" => "...-",
  "w" => ".--",
  "x" => "-..-",
  "y" => "-.--",
  "z" => "--..",
  " " => " ",
  "1" => ".----",
  "2" => "..---",
  "3" => "...--",
  "4" => "....-",
  "5" => ".....",
  "6" => "-....",
  "7" => "--...",
  "8" => "---..",
  "9" => "----.",
  "0" => "-----"
}
MORSE_CODE = morse_dict.invert

p MORSE_CODE[".-"]

p decodeMorse('.... . -.--   .--- ..- -.. .')#, 'HEY JUDE')

