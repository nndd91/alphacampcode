def encode(message, key)
  DigitalCypher.new(message, key).run
end

class DigitalCypher

  ENCODER = {'a'=>1,'b'=>2,'c'=>3,'d'=>4,'e'=>5,'f'=>6,'g'=>7,'h'=>8,'i'=>9,'j'=>10,'k'=>11,'l'=>12,'m'=>13,'n'=>14,'o'=>15,'p'=>16,'q'=>17,'r'=>18,'s'=>19,'t'=>20,'u'=>21,'v'=>22,'w'=>23,'x'=>24,'y'=>25,'z'=>26}

  def initialize(message, key)
    @message = message
    @key = key
  end

  def run
    split_to_array
    matching_keysize_to_message

    @message_split.map.with_index do |each_letter, index|
      final_digit = ENCODER[each_letter] + @digit_split[index].to_i
    end
  end

  private

  def split_to_array
    @digit_split = @key.to_s.chars
    @message_split = @message.chars
  end

  def matching_keysize_to_message
    while @digit_split.size < @message_split.size
      @digit_split += @digit_split
    end
  end
end

p encode("scout", 1939)# [20, 12, 18, 30, 21])
p encode("masterpiece", 1939)#, [14, 10, 22, 29, 6, 27, 19, 18, 6, 12, 8])

# def encode(message, key)

#   encode_dict = {'a'=>1,'b'=>2,'c'=>3,'d'=>4,'e'=>5,'f'=>6,'g'=>7,'h'=>8,'i'=>9,'j'=>10,'k'=>11,'l'=>12,'m'=>13,'n'=>14,'o'=>15,'p'=>16,'q'=>17,'r'=>18,'s'=>19,'t'=>20,'u'=>21,'v'=>22,'w'=>23,'x'=>24,'y'=>25,'z'=>26}

#   digit_split = key.to_s.chars
#   p digit_split
#   message_split = message.chars
#   p message_split

#   while digit_split.size < message_split.size
#     digit_split += digit_split
#   end
#   p digit_split

#   message_split.map.with_index do |each_letter, index|
#     final_digit = encode_dict[each_letter] + digit_split[index].to_i
#   end
# end
