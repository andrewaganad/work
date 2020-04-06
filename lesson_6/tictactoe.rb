require "pry"

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +     # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +     # cols
                [[1, 5, 9], [3, 5, 7]]                  # diagonols

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  if two_marked_squares?(brd, COMPUTER_MARKER)
    WINNING_LINES.each do |line|
      if brd.values_at(line[0], line[1]).count(COMPUTER_MARKER) == 2 &&
         brd.values_at(line[2]).count(INITIAL_MARKER) == 1
        return brd[line[2]] = COMPUTER_MARKER
      elsif brd.values_at(line[1], line[2]).count(COMPUTER_MARKER) == 2 &&
            brd.values_at(line[0]).count(INITIAL_MARKER) == 1
        return brd[line[0]] = COMPUTER_MARKER
      end
    end
  elsif two_marked_squares?(brd, PLAYER_MARKER)
    WINNING_LINES.each do |line|
      if brd.values_at(line[0], line[1]).count(PLAYER_MARKER) == 2 &&
         brd.values_at(line[2]).count(INITIAL_MARKER) == 1
        return brd[line[2]] = COMPUTER_MARKER
      elsif brd.values_at(line[1], line[2]).count(PLAYER_MARKER) == 2 &&
            brd.values_at(line[0]).count(INITIAL_MARKER) == 1
        return brd[line[0]] = COMPUTER_MARKER
      end
    end
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count('X') == 3
      return 'Player'
    elsif brd.values_at(*line).count('O') == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(array, punctuation=', ', conjunction='or')
  last_index = array.size - 1
  if array.size <= 2
    array.join(" #{conjunction} ")
  else
    elements = array.insert(last_index, conjunction).join("#{punctuation}")
    elements[elements.size - 3] = ''
    elements
  end
end

def display_score(player_score, computer_score)
  prompt "Player score: #{player_score} | Computer score: #{computer_score}"
end

def two_marked_squares?(brd, marker)
  WINNING_LINES.each do |line|
    if (brd.values_at(line[0], line[1]).count(marker) == 2 &&
        brd.values_at(line[2]).count(' ') == 1) ||
       (brd.values_at(line[1], line[2]).count(marker) == 2 &&
        brd.values_at(line[0]).count(' ') == 1)
      return true
    end
  end
  false
end

def place_piece!(brd, current)
  if current.start_with?('p')
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current)
  if current.start_with?('p')
    'computer'
  else
    'player'
  end
end

def get_first_player(who_goes_first)
  if who_goes_first == 'choose'
    choice = ''
    loop do
      prompt "Who do you want to go first? (player or computer)"
      choice = gets.chomp
      break if choice.downcase.start_with?('p') || choice.downcase.start_with?('c')
      prompt "Sorry, that's not a valid choice."
    end
    choice
  elsif who_goes_first== 'player'
    'player'
  elsif who_goes_first == 'computer'
    'computer'
  end
end

def update_score(brd, first_score, second_score)
  if detect_winner(brd) == 'Player'
    first_score += 1
  else
    second_score += 1
  end
end

def display_round_winner(brd, first_score, second_score)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "It's a tie!"
  end
  display_score(first_score, second_score)
end

player_score = 0
computer_score = 0
current_player = ''
who_goes_first = 'choose'

prompt "It's a race to 5!"

starts_first = get_first_player(who_goes_first)

loop do
  board = initialize_board
  current_player = starts_first

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  # if someone_won?(board)
  #   if detect_winner(board) == 'Player'
  #     player_score += 1
  #   else
  #     computer_score += 1
  #   end
  #   prompt "#{detect_winner(board)} won!"
  # else
  #   prompt "It's a tie!"
  # end
  update_score(board, player_score, computer_score)
  display_round_winner(board, player_score, computer_score)
  # display_score(player_score, computer_score)

  if player_score == 5
    prompt "Player has won the game!"
    player_score = 0
    computer_score = 0
  elsif computer_score == 5
    prompt "Computer has won the game!"
    player_score = 0
    computer_score = 0
  end

  prompt "Play again? (y to continue or other keys to stop)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe. Goodbye!"
