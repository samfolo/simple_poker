def find_pairs(table)
  evaluated_table = []
  table.each { |hand|
  evaluated_hand = []
  face_val_hand = hand.map {|card| card.split[0]}
    face_val_hand.each { |card|
      sort_sets(card, face_val_hand, evaluated_hand, evaluated_table)
    }
    if !(evaluated_hand.count("pair") == 2) && !(evaluated_hand.include?("3 of a kind") && evaluated_hand.include?("pair"))
      evaluated_table << evaluated_hand[0]
    end
  }
  puts "\n\n"
  print evaluated_table
  puts "\n\n"
  print table
  puts "\n\n"
  evaluated_table
end

def sort_sets(card, face, hand, table)
  face.each { |card|
  hand = sort_single_sets(card, face, hand)
  if hand.include?("pair") || hand.include?("3 of a kind")  || hand.include?("4 of a kind")
    hand.delete("Highest Card")
  end
  }
  sort_multi_sets(hand, table)
end

def sort_single_sets(card, face, hand)
  if face.count(card) > 1
    case face.count(card)
    when 2
      hand << "pair"
    when 3
      hand << "3 of a kind"
    when 4 
      hand << "4 of a kind"
    end
    face.delete(card)
  elsif !hand.include?("Highest Card")
    hand << "Highest Card"
  end
  hand
end

def sort_multi_sets(hand, table)
    if hand.include?("3 of a kind") && hand.include?("pair")
      table << "full house"
    elsif hand.count("pair") == 2
      table << "two pair"
    end
end

table = [["2 of H", "2 of S", "6 of H", "6 of S", "7 of H"], ["2 of S", "2 of H", "2 of S", "2 of H", "3 of S"], ["3 of H", "3 of S", "3 of H", "9 of S", "9 of H"]]

find_pairs(table)