munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  if (0..17).include?(info["age"])
    info["age_group"] = "kid"
  elsif (18..64).include?(info["age"])
    info["age_group"] = "adult"
  else
    info["age_group"] = "senior"
  end
end

p munsters
