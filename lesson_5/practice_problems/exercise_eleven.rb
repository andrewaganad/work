# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# Given this data structure, use a combination of methods, including #select
# or #reject, to return a new array identical to the original's structure but
# leaving only numbers that are multiples of 3

# Algorithm:
# - Given a data structure...
# - Map over each sub-array in arr
#   - Select over each element in each sub-array
#     - num % 3 == 0

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_array = arr.map do |sub_arr|
  sub_arr.select { |num| num % 3 == 0}
end

p new_array

# Post solution notes:
# - Since you're returning a new array, #map will seem like a good choice
# - Can use either #select or #reject but #reject is harder to read
