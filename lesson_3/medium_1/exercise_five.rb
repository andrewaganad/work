limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# The variable limit is defined outside the scope of the fib method definition.
# Since it is a method definition, variables initialized outside of it cannot be
# accessed.

# You can either initialize the limit variable within fib or you can add limit as
# an argument to the definition of fib.
