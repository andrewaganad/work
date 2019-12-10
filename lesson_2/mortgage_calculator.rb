# Problem
  # Build a mortgage calculator
  # Get the inputs of three pieces of information
    # Loan amount
    # Annual Percentage Rate (APR)
    # Loan duration
  # From that info, need to calculate the following two things
    # Monthly interest rate
    # Loan duration in months
  # Use the formula m = p * (j / (1 - (1 + j)**(-n)))
    # m = monthly payment
    # p = loan amount
    # j = monthly interest rate
    # n = loan duration in months
  # Run through Rubocop
# Examples
  # Input
    # Loan amount = 100,000, APR = 3.5%, Loan duration (years) = 15 years
  # Output
    # Monthly interest rate = 3.5% / 15 = 0.23%, Loan duration (months) = 180,
    # Monthly payment = 679.1
  # Things to look out for
    # Conversion of APR to monthly interest rate
    # Conversion of loan duration in years to months
    # Format of percentage inputs. (3.5 or 0.0035?)
# Data structure
  # Integer for loan amounts, Loan duration (years and months)
  # Float for APR, monthly interest rate, monthly payment
# Algorithm
  # PRINT welcome message on the prompt
  # PRINT statement asking for loan amount
  # GET loan amount from user, SET it to variable loan_amount

  # PRINT statement asking for APR %
  # GET APR from user, SET it to variable apr

  # PRINT statement asking for loan duration (years)
  # GET loan duration, SET it to variable loan_duration_years

  # SET variable monthly_rate to APR / loan_duration_years / 100
  # SET variable loan_duration_months to loan_duration_years * 12

  # SET variable monthly_payment to
  # loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_duration_months)))

  # PRINT statement of the monthly payment, with the monthly interest rate and
  # loan duration
require "pry"

def prompt(message)
  puts "=> #{message}"
end

def format_comma(number)
  number.delete(",")
end

def valid_integer?(number)
  number.to_i.to_s == number
end

def valid_float?(number)
  number.to_f.to_s == number
end

def valid_number?(number)
  valid_integer?(number) || valid_float?(number)
end

loop do
  prompt("Welcome to your mortgage loan calculator!")

  loan_amount = ''
  loop do
    prompt("What is your loan amount?")
    loan_amount = gets.chomp

    if loan_amount.include?(",")
      loan_amount = format_comma(loan_amount)
    else
      loan_amount
    end

    if valid_number?(loan_amount)
      break
    else
      prompt("Please enter a valid loan amount.")
    end
  end

  apr = ''
  loop do
    prompt("What is your Annual Percentage Rate?")
    apr = gets.chomp

    if valid_number?(apr)
      break
    else
      prompt("Please enter a valid percentage.")
    end
  end

  loan_duration_years = ''
  loop do
    prompt("How many years will you want the loan for?")
    loan_duration_years = gets.chomp

    if valid_number?(loan_duration_years)
      break
    else
      prompt("Please enter a valid duration.")
    end
  end

  monthly_rate = apr.to_f / loan_duration_years.to_i / 100
  loan_duration_months = loan_duration_years.to_i * 12

  monthly_payment = loan_amount.to_i * (monthly_rate /
                    (1 - (1 + monthly_rate)**(-loan_duration_months)))

  prompt("For a loan duration of #{loan_duration_months} months and monthly interest
       rate of #{monthly_rate * 100}%, your monthly payment will be
       $#{monthly_payment}.")

  prompt("Do you want to calculate another loan amount? (Y, N)")
  answer = gets.chomp.downcase

  break unless answer == 'y'
end
