# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# Given this data structure, return a new array of the same structure but the
# sub-arrays being ordered in descending order.

# Algorithm:
# - Given a data structure...
# - Map over each sub-array in arr
#   - Sort the sub-array, then run reverse on it

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map do |array|
  array.sort.reverse
end

p new_arr

# Post solution notes:
# - Instead of using #reverse, you could've just added a block to # sort and
# - used b <=> a inside the block
