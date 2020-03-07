# Order an array of hashses from earliest to latest

# Algorithm:
# - Given an array of hashes...
# - Sort by a given block for each element in the books array
# - For each hash at the current iteration, sort by the :published value
#   - Make sure to convert the value to an integer first

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

new_array = books.sort_by do |hash|
  hash[:published].to_i
end

p new_array

# Post solution notes:
# I didn't need to convert hash[:published] to an integer since strings can be
# compared. They're all 4 characters long as well.

  
