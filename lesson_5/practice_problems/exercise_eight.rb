hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |word|
    word.each_char do |char|
      if char =~ /[aeiouAEIOU]/
        puts char
      end
    end
  end
end
