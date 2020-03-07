# PROBLEM:

# Order this array of number strings by descending numeric value
# arr = ['10', '11', '9', '7', '8']

# Algorithm:
# - Given an array of number strings...
# - Map over each element in the array
# - Convert each string to an integer
# - Set the result to a variable named integer_numbers
# - Sort integer_numbers by ascending order
# - Destructively reverse integer numbers
# - Map over each element in integer_numbers
#   - Convert each element in that iteration to a string
# - Return integer_numbers

arr = ['10', '11', '9', '7', '8']

integer_numbers = arr.map do |el|
  el.to_i
end

puts integer_numbers.sort.reverse!.map { |el| el.to_s }

# Post solution notes
# - Launch School used a block with #sort
#   - They converted each element to an integer, compared b <=> a 
