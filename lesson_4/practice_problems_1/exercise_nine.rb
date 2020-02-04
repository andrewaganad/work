# The return value is ['bear']. Map iterates  over each element in the collection
# and returns an array of all the return values of the given block. Since 'bear'
# is the only element that satisfies the if statement, 'bear' is returned into a new
# array

# Post solution notes:
# Whenever all the conditions in an if statement don't evaluate to true, the if
# statement itself returns nil, so the return value of map should be [nil, 'bear']
