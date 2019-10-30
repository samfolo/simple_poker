def create_deck
  deck = []

  ["H", "C", "S", "D"].each { |suit|  
    [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"].each { |num|
      deck.push("#{num} of #{suit}") 
    }
  }

  deck
end