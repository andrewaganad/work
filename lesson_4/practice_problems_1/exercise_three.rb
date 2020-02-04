# The return value is: [1, 2, 3]
# This is because reject returns a new array containing values where the block
# did not evaluate to true. Since the return value of puts is nil, each element
# was returned in a new array.
