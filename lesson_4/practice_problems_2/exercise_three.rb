# PROBLEM:

# In the given hash, remove people with age 100 and greater

# ages = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }

# Questions:
# - Does the removal have to be destructive?

# input: Hash
# output: Hash
# rules:
#     Explicit rules:
#       - Ages 100 and greater have to be removed
#     Implicit rules:
#       - Destructively remove it

# Algorithm:
# - Given the hash of names and ages...
# - Iterate over each key-value pair in the hash
#   - If the current value is greater than or equal to 100
#       - Delete the current key

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |name, age| age >= 100 }
p ages

# Post solution notes:
# Can also use #select! or #keep_if. But be aware of the subtle differences in
# their implementation.
