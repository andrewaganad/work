# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# Given this data structure, return an array which contains only the hashes
# where all the integers are even

# Algorithm:
# - Given this data structure...
# - Select among each element in arr against a given block
#   - All integers of sub-array must be even

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_array = arr.select do |hash|
  hash.all? do |letter, numbers|
    numbers.all? { |num| num.even? }
  end
end

p new_array
