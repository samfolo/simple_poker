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
