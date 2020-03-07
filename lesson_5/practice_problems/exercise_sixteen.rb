# PROBLEM:

# Write a method that returns one UUID when called with no parameters.
# Each UUID consists of 32 hexadecimal characters.
# Each UUID is typically broken into 5 sections like this 8-4-4-4-12 and
# represented as a string

# uuid() == "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# input: nothing
# output: String
# rules:
#   explicit:
#     - UUID has to have 8-4-4-4-12 structure
#   implicit:
#     - Only characters from 0-9 and a-f

# Algorithm:
# - Set a constant, HEXADECIMALS, equal to an array of all hexadecimal characters
# - Create an empty array called uuid_array
# - Create an empty string called section_one

# - Push into uuid_array a sample of 8 elements of HEXADECIMALS that are joined
#   together (no space between each character)
# - Push into uuid_array a sample of 4 elements of HEXADECIMALS that are joined
#   together (no space between each character)
# - Push into uuid_array a sample of 4 elements of HEXADECIMALS that are joined
#   together (no space between each character)
# - Push into uuid_array a sample of 4 elements of HEXADECIMALS that are joined
#   together (no space between each character)
# - Push into uuid_array a sample of 12 elements of HEXADECIMALS that are joined
#   together (no space between each character)

# - Return the joined uuid_array with a '-' as a separator

HEXADECIMALS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']

def uuid_generator
  uuid_array = []

  uuid_array << HEXADECIMALS.sample(8).join
  uuid_array << HEXADECIMALS.sample(4).join
  uuid_array << HEXADECIMALS.sample(4).join
  uuid_array << HEXADECIMALS.sample(4).join
  uuid_array << HEXADECIMALS.sample(12).join

  uuid_array.join('-')
end

puts uuid_generator

# Post solution notes:
# LS used #each_with_index on an array containing the number of elements in each
# section. The solution ran #times on each section to add that amount to an empty
# string. 
