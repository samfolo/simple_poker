# CREATING DECK
def create_deck
  deck = []
  # Creates array with cards 2 - Ace, for each suit "H", "C", "S" and "D"
  # Looping through each of the suits
  ["H", "C", "S", "D"].each { |suit|
    # Adding values to suits 2 - Ace
    [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"].each { |num|
      # Pushing each card to the deck array
      deck.push("#{num} of #{suit}")
    }
  }
  # Returning the deck array
  deck
end

# SHUFFLING DECK
def random_shuffle(arr)
  shuffled = []
  # Looping through till length of the array equals 0
  while arr.length > 0
    # Getting a random index to select a card
    ind = rand(arr.length)
    # Pushing the card at the random index to the new "shuffled" array
    shuffled << arr[ind]
    # Deleting the card that was just added to the new array
    # This makes the original array smaller so it'll eventually go to 0 exiting the loop 
    arr.delete_at(ind)
  end
  # Returning the "shuffled" deck array
  shuffled
end

def riffle(arr)
  # Gets first half of array
  first_half = arr[0..(arr.length - 1)/2]
  # Gets second half of array
  second_half = arr[(arr.length - 1)/2 + 1..-1]
  # Puts both arrays in "split_deck" array
  split_deck = [first_half, second_half]
  shuffled = []
  # Loops until theres no cards left in "split_deck" array
  until split_deck.flatten.length <= 1
    # Runs code on the "first_half" array then "second_half" array 
    split_deck.each { |half|
      # Adds first item of the array to new array then deletes it 
      shuffled << half[0]; half.delete_at(0)
    }
  end
  # Returns "shuffled" array
  shuffled
end

def multi_riffle(arr, num)
  # Runs the riffle array multiple times
  num.times { riffle(arr) }
end

def cuts(arr)
  # Sets where to start the cut from
  start = 0
  shuffled_arr = []
  # Looping through until the "shuffled_arr" has all 52 cards in it
  while shuffled_arr.length != 52
    # Sets the size of the chunk, 
    # Plus one so the chunk is never from "start" - "start",
    # Adding start so the "chunk" index is bigger than the "start" index
    chunk = rand(5) + 1 + start
    # Pushing the cards from the "start" index to the "chunk" index
    shuffled_arr.unshift(arr[start .. chunk])
    # setting start equal to "chunk" plus 1 so to start the next chunk at the end of the last one 
    start = chunk + 1
  end
  # Shuffles the chunks into a random order,
  # Removes empty arrays and "nil" values,
  # Joins the arrays using ".flatten" and returns the "shuffle_arr"
  random_shuffle(shuffled_arr.reject { |i| i == [] || i.nil? }).flatten
end

def get_random_card
  # Sets a variable "card" to a random card in the "@shuffled_deck"
  card = @shuffled_deck[rand(@shuffled_deck.length)]
  # Deletes the random card from the "@shuffled_deck"
  @shuffled_deck.delete_at(card)
end

# DEALING CARDS
def deal(players)
  # Throws error if user emters less than 2 players
raise "players must be greater than 2" if players < 2
table = []
# Add each players as an array on the table array
players.times { table << []}
# Creates the global variable for the shuffles deck
@shuffled_deck = cuts(create_deck)
i = 0
# Runs 5 times so each player gets 5 cards
until i == 5
  # Pushes a card onto each player on the table
  table.each { |player| player << @shuffled_deck.shift }
  i += 1
end
# table.each.with_index {|i, j| puts "player #{j + 1}'s hand:  #{i}"}
# Returns the table array with each player now having 5 cards
table
end

def update_deck(deck, table)
  # Removes the cards in the table array from the deck
  deck -= table.flatten
end

def change_cards(table)
  # Loops through each of the arrays in "table"
  table.each_with_index do |hand, i|
    # Shows user their current hand
    print hand, "\n"
    puts "How many cards do you want to change?"
    # Gets amount of cards user wants replaced
    number_of_cards = gets.chomp.to_i
    # Runs unless user doesn't want any cards replaced
    if number_of_cards != 0
      # Shows user their current hand with corresponding index
      show_hand(table, i)
      puts "Which cards do you want to change? Type the indexes and press enter."
      # Asks user for indexes of cards they want removed,
      # Then splits them and turns each into an integer
      indexes = gets.chomp.chars.map(&:to_i)
      cards_to_remove = []
      indexes.each { |index|
        # Subtracts 1 and adds cards at indexs given to "cards_to_remove" array 
        # Subtracts 1 because arrays start at 0 and our index starts at 1
        cards_to_remove << table[i][index - 1]
      }
      # Removes unwanted cards from "hand" array
      hand -= cards_to_remove
      # Cards are discarded, so not added to the deck
      # Deals new cards to "hand"
      hand = deal_new_cards(number_of_cards, table, hand)
      # Prints new hand
      print hand, "\n\n\nDONE.\n"
    end
  end
end

def deal_new_cards(num, table, hand)
  # Removes cards in table array from "@shuffled_deck"
  current_deck = update_deck(@shuffled_deck,table)
  # Deals set number of cards to hand
  num.times { hand << current_deck[rand(current_deck.length)] }
  # Returns hand
  hand
end

def show_hand(table, player)

end


# Create deck
# Ask user shuffle option
# Shuffle deck
# Deal cards
# Update deck
# Ask each player how many cards they want to change
# If they want to change at least 1 card:
# Display the cards with indexes
# Ask the user the index or indexes
# Replace cards if requested (update table)
# Update deck
# test_game = deal(2)
# change_cards(test_game)
# SAMPLE DATA
# letters = ("a".."z").to_a
# letters2 = (1..52).to_a
# numeric_val = {
#   "2": 1, 
#   "3": 2, 
#   "4": 3, 
#   "5": 4, 
#   "6": 5, 
#   "7": 6, 
#   "8": 7, 
#   "9": 8, 
#   "10": 9, 
#   "Jack": 10, 
#   "Queen": 11, 
#   "King": 12, 
#   "Ace": 13
# }

# cards = create_deck
# print cards
# cards.each{ |card|
#   arr = card.split(" ")
#   puts arr[0]
# }
deck = create_deck
print deck
puts "\n\n"

8.times {
  deck = riffle(deck)
  print deck
  puts "\n\n"
}