# PROBLEM:

# Given the array below, turn this array into a hash where the names are the keys
# and its positions are the values

# { 'Fred' => 0, 'Barney' => 1, 'Wilma' => 2, 'Betty' => 3, 'Pebbles' => 4,
#   'BamBam' => 5 }

# input: Array
# output: Hash
# rules:
#     Explicit requirements:
#       - Keys will be the element
#       - Values will be the position of the element

# Algorithm:
# - Create an empty hash called names_and_index
# - Given the array...
# - Iterate over each element in flintstones
#   - Each element will be a key in names_and_index
#   - Set the key's value to the index of the key
# - Return names_and_index

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
names_and_index = {}

flintstones.each { |name| names_and_index[name] = flintstones.index(name) }
p names_and_index

# Post solution notes:
# When I was thinking about the problem, I could've sworn there was a method
# called each_with_index, but I wasn't able to find it in array. I had the right
# idea, but the method was in Enumerable.
