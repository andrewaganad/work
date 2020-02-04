# PROBLEM:

# Pick out the minimum age from the Munster family hash

# 10

# Questions:
# - Do I pick out the name as well or just the age?

# input: hash
# output: integer and/or string
# rules:
#     Explicit:
#       - Pick out the smallest age from the hash
#     Implicit:
#       - An integer is returned, not the string

# Algorithm:
# - Given the ages hash...
# - Obtain all the values of the hash into an array
# - Find the min value of that array

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min
