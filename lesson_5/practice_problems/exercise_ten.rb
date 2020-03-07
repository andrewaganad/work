# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# Given this data structure, use #map to return a new array that's identical in
# structure but with each integer incremented by 1.

# Algorithm:
# - Given a data structure...
# - Map over each hash
#   - Create an empty hash called new_hash
#   - Iterate over each k/v pair
#     - Set new_hash[k] = v + 1
#   - Return new_hash

new_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  new_hash = {}
  hash.each { |k, v| new_hash[k] = v + 1 }
  new_hash
end

p new_arr

# Post solution notes:
# - Ended up having the same solution as LS
# - Can also use #each_with_object, which I initially tried but couldn't figure
# out how to properly use that method

# It's important to understand the method implementation, what arguments and blocks
# can be passed to it and its return value 
