produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  value_is_fruit = {}
  keys = hash.keys
  counter = 0

  loop do
    if hash[keys[counter]] == 'Fruit'
      value_is_fruit[keys[counter]] = hash[keys[counter]]
    end
    counter += 1
    break if counter == hash.size
  end

  value_is_fruit
end

p select_fruit(produce)

# Post solution notes
# Remember, one of the criteria of loops is having a way to retrieve the current value.
#   In this case, have a way to retrieve the current key AND current value.
