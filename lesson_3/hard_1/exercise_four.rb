def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  counter = 4

  while dot_separated_words.size > 0 && counter > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
    counter -= 1
  end
  
  dot_separated_words.empty? && counter == 0
end


# Post solution notes
# Can just add a check for dot_separated_words.size after splitting the string
