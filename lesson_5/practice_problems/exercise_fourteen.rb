# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# Given this data structure, return an array containing the colors of the fruits
# and the sizes of the vegetables. The colors should be capitalized and the sizes
# should be uppercase.

# Algorithm:
# - Given this data structure...
# - Create an empty array called result_array
# - Iterate over each k/v pair in hsh
#   - If the value[:type] == 'fruit'
#     - Map over each element in value[:colors]
#       - Capitalize each element
#       - Save the mapped out result in a variable, capitalized_colors
#     - Push capitalized_colors into result_array
#   - Else
#     - Convert value[:size] to uppercase
#     - Save the result in a variable, uppercase_size
#     - Push uppercase_size to result_array

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result_array = []
hsh.each do |food, details|
  if details[:type] == 'fruit'
    capitalized_colors = details[:colors].map do |color|
      color.capitalize
    end
    result_array << capitalized_colors
  else
    uppercase_size = details[:size].upcase
    result_array << uppercase_size
  end
end

p result_array

# Post solution notes:
# - LS used #map on the outer hash because running #map on a ahsh always returns 
# an array.
