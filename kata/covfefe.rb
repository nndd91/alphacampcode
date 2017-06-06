# Assumptions #
# Given a normal sentence where each word is seperated by a space.
# Sometimes there is a wierd space at the end according to test case

def covfefe(tweet)
  Trump.new(tweet).dozed_off
end

class Trump
  def initialize(tweet)
    @tweet = tweet
  end

  def count_empty_spaces
    @empty_spaces = 0
    while @tweet[-@empty_spaces - 1] == " "
      @empty_spaces += 1
    end
  end

  def check_coverage
    if @tweet.include?("coverage")
      @last_word = " " * @empty_spaces
    else
      @last_word = (" " * @empty_spaces) + " covfefe"
    end
  end

  def dozed_off
    count_empty_spaces
    check_coverage

    result = @tweet.split(" ").map do |word|
      word == "coverage" ? "covfefe" : word
    end.join(" ")

    result + @last_word
  end
end


p covfefe("coverage")# "covfefe")
p covfefe("coverage coverage")# "covfefe covfefe")
p covfefe("nothing")# "nothing covfefe")
p covfefe("double space ")# "double space  covfefe")
p covfefe("covfefe")# "covfefe covfefe")

p "double space covfefe" == "double space covfefe"


# def covfefe(tweet)
#   tweet.include?("coverage") ? edited_tweet = tweet : edited_tweet = tweet + " covfefe"
#   edited_tweet.split(" ").map { |word| word == "coverage" ? "covfefe" : word }.join(" ")
# end
