
  def royal_flush?(hand)
    if straight_flush?(hand)
      puts "Royal Flush" if get_hands_value(hand)[0] == 9
    end
  end

  def straight_flush?(hand)
    "Straight Flush" if flush?(hand) && straight?(hand)
  end

  def flush?(hand)
    suit_hand = get_suits(hand)
    if suit_hand.count("D") == 5 || suit_hand.count("C") == 5 || suit_hand.count("H") == 5 || suit_hand.count("S") == 5
      "Flush"
    end
  end

  def straight?(hand)
    numeric_hand = get_hands_value(hand)
    i = 0
    pre_card = ""
    numeric_hand.each_with_index{ |card, index|
      if pre_card != ""
        if pre_card == card.to_i - 1
          i +=1
        end
      end
      pre_card = card
    }
    "Straight" if i == 4
  end

  def get_suits(hand)
    suit_hand = []
    hand.each { |card|
      card.split(" ")
      suit_hand << card[-1]
    }
    suit_hand
  end

  def get_hands_value(hand)
    numeric_hand = []
    hand.each { |cards|
      numeric_hand << get_cards_value(cards)
    }
    numeric_hand.sort!
  end

  def get_cards_value(cards)
    numeric_val = { "2" => 1, "3" => 2, "4" => 3, "5" => 4, 
                    "6" => 5, "7" => 6, "8" => 7, "9" => 8, 
                    "10" => 9, "Jack" => 10, "Queen" => 11, 
                    "King" => 12, "Ace" => 13
                  }
    face_val = cards.split[0]
    numeric_val.each{ |key, value|
      if key == face_val
        return value
      end
    }
  end



hand = ["10 of D", "Jack of D", "Queen of D", "King of D", "9 of D"]
puts "\n"
print royal_flush?(hand)
puts "\n"