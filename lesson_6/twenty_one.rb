SCORE_LIMIT = 21
DEALER_LIMIT = 17

CARDS = {
  suits: ['H', 'D', 'S', 'C'],
  card: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
}

def prompt(msg)
  puts "=> #{msg}"
end

def total(hand)
  values = hand.map { |card| card[1] }
  total = 0

  values.each do |value|
    if value == value.to_i.to_s
      total += value.to_i
    elsif value == 'A'
      total += 11
    else
      total += 10
    end
  end

  values.select { |value| value == 'A' }.count.times do
    total -= 10 if total > SCORE_LIMIT
  end

  total
end

def initialize_deck
  deck = []
  CARDS[:suits].each do |suit|
    CARDS[:card].each do |value|
      deck << [suit, value]
    end
  end
  deck
end

def deal_card(deck, hand)
  hand << deck.delete(deck.sample)
end

def display_dealer_hand_minus_one(hand)
  prompt "Dealer's hand: #{hand[1..-1]}"
end

def display_player_hand(hand)
  prompt "Your hand: #{hand}"
end

def display_dealer_hand(hand)
  prompt "Dealer's hand: #{hand}"
end

def busted?(total)
  total > 21
end

def display_total(player_total, dealer_total)
  prompt("Player total: #{player_total} | " \
         "Dealer total: #{dealer_total}")
end

def display_result(player_total, dealer_total)
  result = detect_result(player_total, dealer_total)

  case result
  when :player_busted
    prompt "You busted!"
  when :dealer_busted
    prompt "The dealer busted!"
  when :player
    prompt "You won!"
  when :dealer
    prompt "The dealer won!"
  when :tie
    prompt "You and the dealer tied!"
  end
end

def reset_hands(hands)
  hands[:player_hand] = []
  hands[:dealer_hand] = []
end

def game_options
  prompt "Do you want to play again? (y/n)"
  loop do
    choice = gets.chomp
    if choice.downcase.start_with?('y')
      break
    else
      prompt "Thanks for playing Twenty One. Goodbye!"
      exit
    end
  end
end

def display_total_hand(hand)
  prompt "Total: #{hand}"
end

def detect_result(player_total, dealer_total)
  if player_total > SCORE_LIMIT
    :player_busted
  elsif dealer_total > SCORE_LIMIT
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def match_over?(score)
  score[:player_score] == 5 || score[:dealer_score] == 5
end

def detect_match_winner(score)
  if score[:player_score] == 5
    :player
  else
    :dealer
  end
end

def display_match_winner(score)
  winner = detect_match_winner(score)

  if winner == :player
    prompt "You won the match!"
  else
    prompt "The dealer won the match!"
  end
end

def update_score(score, player_total, dealer_total)
  result = detect_result(player_total, dealer_total)

  if result == :player_busted || result == :dealer
    score[:dealer_score] += 1
  elsif result == :dealer_busted || result == :player
    score[:player_score] += 1
  end
end

def display_score(score)
  prompt("Player score: #{score[:player_score]} | " \
         "Dealer score: #{score[:dealer_score]}")
end

def reset_score(score)
  score[:player_score] = 0
  score[:dealer_score] = 0
end

def results_process(player_total, dealer_total, score, hands)
  update_score(score, player_total, dealer_total)
  display_total(player_total, dealer_total)
  display_result(player_total, dealer_total)
  display_score(score)
  reset_hands(hands)
  if match_over?(score)
    display_match_winner(score)
    reset_score(score)
  end
  game_options
end

score = { player_score: 0, dealer_score: 0 }

loop do
  hands = { player_hand: [], dealer_hand: [] }
  player_total = nil
  dealer_total = nil
  prompt "Welcome to Twenty-One! First to 5 points wins the match."

  deck = initialize_deck
  2.times do
    deal_card(deck, hands[:player_hand])
    deal_card(deck, hands[:dealer_hand])
  end

  player_total = total(hands[:player_hand])
  display_player_hand(hands[:player_hand])
  display_total_hand(player_total)
  display_dealer_hand_minus_one(hands[:dealer_hand])

  answer = nil
  loop do
    loop do
      prompt "Hit or stay? (h/s)"
      answer = gets.chomp
      break if answer.downcase.start_with?('h', 's')
      prompt "That's not a valid answer."
    end
    deal_card(deck, hands[:player_hand]) if answer.start_with?('h')
    display_player_hand(hands[:player_hand])
    player_total = total(hands[:player_hand])
    display_total_hand(player_total)
    break if answer.start_with?('s') || busted?(player_total)
  end

  if busted?(player_total)
    dealer_total = total(hands[:dealer_hand])
    results_process(player_total, dealer_total, score, hands)
    redo
  else
    prompt "You chose to stay!"
  end

  loop do
    display_dealer_hand(hands[:dealer_hand])
    dealer_total = total(hands[:dealer_hand])
    display_total_hand(dealer_total)
    break if total(hands[:dealer_hand]) >= DEALER_LIMIT || busted?(dealer_total)
    prompt "Dealer will hit."
    deal_card(deck, hands[:dealer_hand])
  end

  if busted?(dealer_total)
    results_process(player_total, dealer_total, score, hands)
    redo
  else
    results_process(player_total, dealer_total, score, hands)
  end
end

# Bonus features:
# 1. If you cache each player's totals in local variables once at the top of the
#    main loop, each total will not continue to update correctly when called.
#    Each time the hand is called, you have to update that specific hand,
#    otherwise the original total at the top of the main loop will be used (0).

# 2. The third play_again? method doesn't explicitly use next as a result of it
#    being the last method at the end of the loop. It doesn't need next because
#    the loop will naturally start all over again whereas in the previous two
#    the loop would continue despite busting,
