def duplicate_encode(word)
  Encode.new(word).start
end

class Encode

  def initialize(word)
    @word = word
    @letters_hash = {}
  end

  def start
    make_hash
    translating_word
  end

  private

  def make_hash
    @word.downcase.each_char do |letter|
      @letters_hash.has_key?(letter) ? @letters_hash[letter] += 1 : @letters_hash[letter] = 1
    end
  end

  def translating_word
    @word.downcase.each_char.map { |letter| @letters_hash[letter] == 1 ? '(' : ')' }. join('')
  end
end

p duplicate_encode("din")#"(((")
p duplicate_encode("recede")#"()()()")
p duplicate_encode("Success")#")())())"#"should ignore case")
p duplicate_encode("(( @")#"))((")
