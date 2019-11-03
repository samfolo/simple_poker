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
# shuffled = []
# while letters.length > 0
#   ind = rand(letters.length - 1)
#   shuffled << letters[ind]
#   letters.delete_at(ind)
# end

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
  print shuffled2, "\n"
  shuffled2
end

def multi_riffle(arr)
  4.times { riffle(arr) }
end

# print letters2, "\n"
# arr = riffle(letters2)
# for i in 1..15
#   arr = riffle(arr)
# end

def cuts(arr)
  start = 0
  shuffled_arr = []
  while shuffled_arr.length != 52
    chunk = rand(6) + start
    shuffled_arr.unshift(arr[start .. chunk])
    start = chunk + 1
  end
  shuffled_arr.reject(&:nil?)
end

cuts(create_deck)
# test