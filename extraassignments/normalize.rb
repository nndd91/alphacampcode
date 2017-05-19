# Module to add method to array class
module Normalize
  def normalize
    normalizetable = { 1 => 'one',
                       2 => 'two',
                       3 => 'three',
                       4 => 'four',
                       5 => 'five',
                       6 => 'six',
                       7 => 'seven',
                       8 => 'eight',
                       9 => 'nine' }
    map { |x| normalizetable[x.to_i] }
  end
end

# Include methods for even and odd
module OddandEven
  def even
    reject { |x| x.odd? }
  end

  def odd
    reject { |x| x.even? }
  end
end

# Addtional Method for Array Class
class Array
  include Normalize
  include OddandEven

  # better way of writing
  # def humanize
  #   self.map(&:in_words)
  # end
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p [1, 2, 3].normalize
p arr.even
p arr.odd
