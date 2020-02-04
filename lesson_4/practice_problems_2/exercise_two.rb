# PROBLEM:

# Add up all the ages from the Munster family hash
# Add up all the values in the given hash

# input: integer
# output: integer
# rules:
#     Explicit:
#       - Provide the sum of the values of teh given hash

# Algorithm:
# - Given the Munster family hash...
# - Obtain the values of the ages hash using the Hash#values method
# - On the return value, sum the given ages

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts ages.values.sum 
