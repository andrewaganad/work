def titleize(words)
  words.split.map { |word| word.capitalize }.join(' ')
end

words = "the flintstones rock"
puts titleize(words)
puts words
