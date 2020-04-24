# Pseudo code
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

# Data structure
[['H', '2'], ['S', 'J'], ['D', 'A']]
[['H', '2'], ['S', '8'], ['D', 'A']]

def total(array)
  total = 0
  array.each do |card|
    if card[1] == card[1].to_i.to_s
      total += card[1].to_i
    else
      if card[1] == 'A'
        total <= 10 ? total += 11 : total += 1
      else
        total += 10
      end
    end
  end
  total
end

puts total([['H', '2'], ['S', 'J'], ['D', 'A']])
puts total([['H', '2'], ['S', '8'], ['D', 'A']])
puts total([['H', 'J'], ['S', 'J'], ['D', 'A']])

# Player's turn
# 1. Ask 'hit' or 'stay'
# 2. If 'stay', stop asking
# 3. otherwise, go to 1.

answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted? # the busted? method is not shown
end

if busted?
  # probably end the game? or ask the user to play again?
else
  puts "You chose to stay!" # if player didn't bust, must have stayed to get here
end

# ... continue on to Dealer turn
# - Break if stay || busted?
# - if dealer's cards are less than 17, hit
# - otherwise can hit or stay (randomized)

# - if busted?
#   - end the game or ask to play again
# - else
#   - print the computer chose to stay

determine_winner
display_winner
