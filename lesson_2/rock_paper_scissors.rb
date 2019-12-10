VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES_SHORT = [
  VALID_CHOICES[0][0], VALID_CHOICES[1][0],
  (VALID_CHOICES[2][0] + VALID_CHOICES[2][1]),
  VALID_CHOICES[3][0],
  (VALID_CHOICES[4][0] + VALID_CHOICES[4][1])
]

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  winning_moves = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['paper', 'spock'],
    'spock' => ['rock', 'scissors']
  }

  winning_moves[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def five_points(player_score, computer_score)
  if player_score == 5
    prompt("You are the grand winner!")
  elsif computer_score == 5
    prompt("The computer is the grand winner!")
  end
end

choice_score = 0
computer_score = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}. You can just enter in " \
           "the first initial. For scissors or spock, enter in the first two " \
           "letters.")
    choice = gets.chomp

    if choice.start_with?(VALID_CHOICES_SHORT[0], VALID_CHOICES_SHORT[1],
                          VALID_CHOICES_SHORT[2], VALID_CHOICES_SHORT[3],
                          VALID_CHOICES_SHORT[4])
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES_SHORT.sample

  case choice
  when "r"
    choice = "rock"
  when "p"
    choice = "paper"
  when "sc"
    choice = "scissors"
  when "l"
    choice = "lizard"
  when "sp"
    choice = "spock"
  end

  case computer_choice
  when "r"
    computer_choice = "rock"
  when "p"
    computer_choice = "paper"
  when "sc"
    computer_choice = "scissors"
  when "l"
    computer_choice = "lizard"
  when "sp"
    computer_choice = "spock"
  end

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    choice_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  prompt("You: #{choice_score} | Computer: #{computer_score}")

  five_points(choice_score, computer_score)

  if choice_score == 5 || computer_score == 5
    choice_score = 0
    computer_score = 0
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
