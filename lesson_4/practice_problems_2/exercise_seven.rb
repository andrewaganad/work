statement = "The Flintstones Rock"
frequency = Hash.new(0)

statement.delete(' ').each_char do |char|
  frequency[char] += 1
end

p frequency
