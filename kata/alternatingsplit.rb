def encrypt(text, n)
  #puts "Encrypting...<#{text}>..."
  final_string = text
  while n > 0
    left_string = ""
    right_string = ""
    for i in (0..final_string.length-1) do
      if i%2==0 #2nd char is 1 3
        right_string += final_string[i]
      else
        left_string += final_string[i]
      end
    end
    final_string = left_string + right_string
    n -= 1
  end
  return final_string
end

def decrypt(encrypted_text, n)
  #puts "Decrypting...<#{encrypted_text}>"
  while n > 0
    final_string = Array.new(encrypted_text.length)
    midpoint = encrypted_text.length/2
    for i in 0..midpoint-1 do
      final_string[(i*2)] = encrypted_text[i+midpoint]
      final_string[1+(i*2)] = encrypted_text[i]
    end
    if final_string[-1].nil?
      final_string[-1] = encrypted_text[-1]
    end
    encrypted_text = final_string.join("")
    n -= 1
  end
  return encrypted_text
end

p encrypt("hello apple", 1)
puts
p decrypt(encrypt("hello apple", 1), 1)
puts

p encrypt("hello apple!", 2)
puts
p decrypt(encrypt("hello apple!", 2), 2)
puts

p encrypt("Get out SAM!!", 3)
puts
p decrypt(encrypt("Get out SAM!!", 3), 3)
puts
