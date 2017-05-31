def disemvowel(str)
  str.gsub!(/[aeiouAEIOU]/, '')
end

p disemvowel("This website is for losers LOL!")#,  "Ths wbst s fr lsrs LL!")
