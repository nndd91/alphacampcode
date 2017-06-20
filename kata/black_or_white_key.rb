def black_or_white_key(key_press_count)
  ColorFinder.new(key_press_count).color
end

class ColorFinder
  NOTES = [ "A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#" ]

  def initialize(key_press_count)
    @key = key_reduction(key_press_count)
    @note = NOTES[@key - 1]
  end

  def color
    return "black" if @note.include?("#")
    "white"
  end

  private

  def key_reduction(key_press_count)
    # Keyboard = 88 keys
    # Octave = 12 keys
    key_press_count -= 88 while key_press_count > 88
    key_press_count -= 12 while key_press_count > 12
    key_press_count
  end
end

p black_or_white_key(1) == "white"
p black_or_white_key(5) == "black"
p black_or_white_key(12) == "black"
p black_or_white_key(42) == "white"
p black_or_white_key(88) == "white"
p black_or_white_key(89) == "white"
p black_or_white_key(92) == "white"
p black_or_white_key(100) == "black"
p black_or_white_key(111) == "white"
p black_or_white_key(200) == "black"
p black_or_white_key(2017) == "white"
