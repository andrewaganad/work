# Algorithm:
# - Create an empty array called male_ages
# - Given a nested Hash
# - Iterate over each key Hash
#   - If the value of the "gender" at the current key is "male"
#     - Push the value of "age" into male_ages
# - Use the sum method on male_ages

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_ages = []

munsters.each do |name, info|
  if info["gender"] == "male"
    male_ages << info["age"]
  end
end

puts male_ages.sum

# Post solution notes:
# - LS used #each_value instead of #each 
