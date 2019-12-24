# Problem
  # Write a one-line program that creates an output 10 times, with each
  # subsequent line indented 1 space to the right.
# Example
  # Input
    # extra_indent("The")
  # Output
    # The
    #  The
    #   The etc... until 10 lines
# Data structure
  # String
# Algorithm
  # Given a string
  # Iterate over the string 10 times
  # Print out the string
  # Prepend the string with a space

10.times { |num| puts (" " * num) + "The Flintstones Rock!" }
