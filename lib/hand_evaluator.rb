def highest_card(table)
  numeric_table = []
  table.each { |hand|
    numeric_table << get_hands_value(hand)
  }
  numeric_table
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

def get_hands_value(hand)
  numeric_hand = []
  hand.each { |cards|
    numeric_hand << get_cards_value(cards)
  }
  numeric_hand
end

def compair_cards(table ,hand, index)
  hand_1 = hand.sort
  hand_2 = table[index+1].sort
  if hand_1[-1] > hand_2[-1]
    hand_1
  else
    hand_2 
  end
end

def get_highest_card(table)
  winning_hand = table[0]
  table[1..-1].each_with_index { |hand, index|
    winning_hand = compair_cards(table ,hand, index)
  }
  winning_hand
end


table = [["2 of H", "5 of C", "4 of H", "King of D", "7 of S"], ["2 of S", "3 of H", "10 of D", "Queen of C", "Ace of H"]]

get_highest_card(highest_card(table))