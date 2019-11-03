def create_deck
  deck = []

  ["H", "C", "S", "D"].each { |suit|
    [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"].each { |num|
      deck.push("#{num} of #{suit}")
    }
  }

  deck
end

def get_random_card
  card = @shuffled_deck[rand(@shuffled_deck.length)]
  @shuffled_deck.delete_at(card)
end

# letters = ("a".."z").to_a
def random_shuffle(arr)
  
  shuffled = []
  while arr.length > 0
    ind = rand(arr.length)
    shuffled << arr[ind]
    arr.delete_at(ind)
  end
  shuffled
end

# puts shuffled
letters2 = (1..52).to_a
def riffle(arr)
  letters2a = arr[0..(arr.length - 1)/2]
  letters2b = arr[(arr.length - 1)/2 + 1..-1]
  letters2halved = [letters2a, letters2b]
  shuffled2 = []
  until letters2halved.flatten.length <= 1
    letters2halved.each { |half|
      shuffled2 << half[0]; half.delete_at(0)
    }
  end
  # print shuffled2, "\n"
  shuffled2
end

def multi_riffle(arr)
  4.times { riffle(arr) }
end



def cuts(arr)
  start = 0
  shuffled_arr = []
  while shuffled_arr.length != 52
    chunk = rand(5) + start + 1
    shuffled_arr.unshift(arr[start .. chunk])
    start = chunk + 1
  end
  random_shuffle(shuffled_arr.reject { |i| i == [] || i.nil? }).flatten
end

# cut_deck = cuts(create_deck)
# i = 1
# while true
#   i += 1
#   if cuts(create_deck).include?([])
#     print cuts(create_deck).flatten, "\n\n  #{i} times"
#     break
#   end
# end

# random_shuffle(cut_deck)
# test

# print letters2, "\n"
# arr = riffle(letters2)
# for i in 1..15
#   arr = riffle(create_deck)
#   print arr
# end

#  deal to 5
def deal(players)
raise "players must be greater than 2" if players < 2
table = []
players.times { table << []}
@shuffled_deck = cuts(create_deck)
i = 0
until i == 5
table.each { |player| player << @shuffled_deck.shift }
i += 1
end
table
# table.each.with_index {|i, j| puts "player #{j + 1}'s hand:  #{i}"}
end

test_game = deal(4)

# Create deck
# Ask user shuffle option
# Shaffle deck
# Deal cards
# Update deck
# Ask each player how many cards they want to change
# If they want to change at least 1 card:
# Display the cards with indexes
# Ask the user the index or indexes
# Replace cards if requested (update table)
# Update deck

def update_deck(deck, table)
  deck -= table.flatten
end

def change_cards(table)
  table.each_with_index do |hand, i|
    print hand, "\n"
    puts "How many cards do you want to change?"
    number_of_cards = gets.chomp.to_i
    if number_of_cards != 0
      show_hand(table, i)
      puts "Which cards do you want to change? Type the indexes and press enter."
      indexes = gets.chomp.chars.map(&:to_i)
      cards_to_remove = []
      indexes.each { |index| 
        cards_to_remove << table[i][index - 1]
      }
      hand -= cards_to_remove
      # cards are discarded, so not added to the deck
      hand = deal_new_cards(number_of_cards, table, hand)
      print hand, "\n\n\nDONE.\n"
    end
  end
end

def deal_new_cards(num, table, hand)
  current_deck = update_deck(@shuffled_deck,table)
  num.times { hand << current_deck[rand(current_deck.length)] }
  hand
end

def show_hand(table, player)

end

change_cards(test_game)
