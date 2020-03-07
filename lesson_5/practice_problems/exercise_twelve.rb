# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# Given this data structure, and without using #to_h method, return a hash where
# the key will be the first element of each sub-array, and the value will be the
# second element

# Algorithm:
# - Given this data structure
# - Create an empty hash called result_hash
# - Iterate over each element in arr
#   - Set variable, first_element, equal to sub_array[0]
#   - Set variable, second_element, equal to sub_array[1]
#   - Set result_hash[first_element] = second_element
# - Return result_hash

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

result_hash = {}
arr.each do |sub_array|
  first_element = sub_array[0]
  second_element = sub_array[1]
  result_hash[first_element] = second_element
end

p result_hash

# Post solution notes:
# - Did the same as LS. 
