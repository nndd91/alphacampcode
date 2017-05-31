def weirdcase string
  #TODO
  array = string.split(" ")
  array.map! do |word|
    wierd_word = word.chars.map.with_index { |el, i| i%2 != 0 ? el : el.upcase }
    wierd_word.join('')
  end
  return array.join(' ')
end

p weirdcase('Wow look at this one')# 'ThIs Is A TeSt');
p weirdcase('This')# 'ThIs');
p weirdcase('is')# 'Is');
p weirdcase('This is a test')# 'ThIs Is A TeSt');

