CARDS = {
  suits: ['H', 'D', 'S', 'C'],
  card: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
}

def prompt(msg)
  puts "=> #{msg}"
end

def total(hand)
  total = 0
  hand.each do |card|
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

def initialize_deck
  deck = []
  CARDS[:suits].each do |suit|
    CARDS[:card].each do |value|
      deck << [suit, value]
    end
  end
  deck
end

# Method to deal a card
def deal_card(deck, hand)
  hand << deck.delete(deck.sample)
end

# Methods to display cards
def display_dealer_hand_minus_one(hand)
  prompt "Dealer's hand: #{hand[1..-1]}"
end

def display_player_hand(hand)
  prompt "Your hand: #{hand}"
end

def display_dealer_hand(hand)
  prompt "Dealer's hand: #{hand}"
end

def busted?(hand)
  total(hand) > 21
end

def display_total(player_hand, dealer_hand)
  prompt("Player total: #{total(player_hand)} | Dealer total: #{total(dealer_hand)}")
end

def display_result(player_hand, dealer_hand)
  if total(player_hand) > total(dealer_hand)
    prompt "You won!"
  elsif total(player_hand) < total(dealer_hand)
    prompt "The Dealer won!"
  else
    prompt "You and the Dealer tied!"
  end
end

def reset_hands(hands)
  hands[:player_hand] = []
  hands[:dealer_hand] = []
end

def game_options
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

loop do
  hands = { player_hand: [], dealer_hand: [] }
  prompt "Welcome to Twenty-One!"

  deck = initialize_deck
  2.times do
    deal_card(deck, hands[:player_hand])
    deal_card(deck, hands[:dealer_hand])
  end

  display_player_hand(hands[:player_hand])
  display_dealer_hand_minus_one(hands[:dealer_hand])

  answer = nil
  loop do
    loop do
      prompt "Hit or stay?"
      answer = gets.chomp
      break if answer.downcase.start_with?('h') ||
               answer.downcase.start_with?('s')
      prompt "That's not a valid answer."
    end
    deal_card(deck, hands[:player_hand]) if answer.start_with?('h')
    display_player_hand(hands[:player_hand])
    break if answer.start_with?('s') || busted?(hands[:player_hand])
  end

  if busted?(hands[:player_hand])
    reset_hands(hands)
    prompt "You busted! Do you want to play again? (y/n)"
    game_options
    redo
  else
    prompt "You chose to stay!"
  end

  loop do
    display_dealer_hand(hands[:dealer_hand])
    break if total(hands[:dealer_hand]) >= 17 || busted?(hands[:dealer_hand])
    prompt "Dealer will hit."
    deal_card(deck, hands[:dealer_hand])
  end

  if busted?(hands[:dealer_hand])
    reset_hands(hands)
    prompt "The Dealer busted! Do you want to play again? (y/n)"
    game_options
    redo
  else
    display_total(hands[:player_hand], hands[:dealer_hand])
    display_result(hands[:player_hand], hands[:dealer_hand])
    reset_hands(hands)
    prompt "Do you want to play again? (y/n)"
    game_options
  end
end
