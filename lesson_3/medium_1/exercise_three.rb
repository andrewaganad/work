def factors(number)
  divisor = number
  factors = []
  if number > 0
    while divisor > 0
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end
  else
    puts "This number has to be greater than 0!"
  end
  factors
end

puts factors(0)

# The purpose of number % divisor == 0 is to make sure each factor is the result
# of no remainder

# The purpose of the last line 'factors' is to return the resulting array 
