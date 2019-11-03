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
  create_deck[rand(52)]
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
table = []
players.times { table << []}
shuffled_deck = cuts(create_deck)
i = 0
until i == 5
table.each { |player| player << shuffled_deck.shift; shuffled_deck = shuffled_deck[1..-1] }
i += 1
end
table.each.with_index {|i, j| puts "player #{j + 1}'s hand:  #{i}"}
end

deal(5)







