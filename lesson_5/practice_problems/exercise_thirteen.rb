# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# Given this data structure, return a new array with the same sub-arrays logically
# ordered only according to the sub-array's odd numbers

# Algorithm:
# - Given this data structure
# - Sort by a given block for each element in arr
# - Select only certain elements of each sub-array with a given block
#   - Select based on if the element at the current iteration is odd

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_array = arr.sort_by do |sub_array|
  sub_array.select { |num| num.odd? }
end

p new_array

# Post solution notes:
# #sort_by is still a little confusing. Notes just for me: #sort_by takes the return
# value of the given block and applies it to each element it iterates on in the
# given array. Then, with those selections, it sorts through it. 
