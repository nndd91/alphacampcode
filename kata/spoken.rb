spoken    = ->(greeting) { greeting + '.' }
shouted   = ->(greeting) { greeting.upcase + '!' }
whispered = ->(greeting) { greeting.downcase + '.' }

greet = ->(style, msg) { style.call(msg) }

p spoken.call('hello')
p shouted.call('hello')
p whispered.call('hello')


p greet.(spoken, "Hello") #, "Hello.")
p greet.(shouted, "Hello") #, "HELLO!")
p greet.(whispered, "Hello") #, "hello.")
