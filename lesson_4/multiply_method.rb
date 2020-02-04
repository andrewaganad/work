def multiply(numbers, multiple)
  new_array = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    new_array << current_number * multiple

    counter += 1
  end

  new_array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
