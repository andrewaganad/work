# PROBLEM:

# Find the index of the first name in the flinstones array that starts with "Be"

# Betty

# input: array
# output: integer
# rules:
#     - explicit:
#       - index of the first name that starts with "Be" will be returned
#     - implicit:
#       - name is case sensitive

# Algorithm:
# - Iterate over each element in the flintstones array
#   - Return the current element if the first two letters start with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  index if name[0..1] == "Be"
end
