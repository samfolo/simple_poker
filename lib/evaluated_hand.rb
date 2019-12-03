class EvaluatedHand

  NUMERIC_VAL = { "2" => 1, "3" => 2, "4" => 3, "5" => 4, 
  "6" => 5, "7" => 6, "8" => 7, "9" => 8, 
  "10" => 9, "Jack" => 10, "Queen" => 11, 
  "King" => 12, "Ace" => 13
  }

  def initialize(hand)
    @hand = hand
    @result = []
    @suits = ["S", "D", "C", "H"]
  end

  def pair?
    gather_pairs
    @result.include?("Pair") ? "Pair" : "Highest Card"
  end

  def two_pair?
    gather_pairs
    @result.count("Pair") == 2 ? "Two Pair" : pair?
  end

  def three_of_a_kind?
  count_cards("3 of a Kind", 3)
  @result[0] ? "3 of a Kind" : two_pair?
  end

  def straight?
    numeric_hand = get_numeric_hand
    i = 0
    pre_card = ""
    numeric_hand.each { |card|
      (i += 1 if pre_card == card.to_i - 1) if pre_card != ""
      pre_card = card
    }
    i == 4 ? "Straight" : three_of_a_kind?
  end

  def flush?
    suit_hand = get_suit_val
    suit_hand.uniq.length == 1 ? "Flush" : straight?
  end

  def full_house?
    three_of_a_kind? && pair? == "Pair" ? "Full House" : flush?
  end

  def four_of_a_kind?
    count_cards("4 of a Kind", 4)
    @result[0] ? "4 of a Kind" : full_house?
  end

  def straight_flush?
    straight? == "Straight" && flush? == "Flush" ? "Straight Flush" : four_of_a_kind?
  end

  def royal_flush?
    straight_flush? && get_numeric_hand[0] == 9 ? "Royal Flush" : straight_flush?
  end

  private

  def get_face_val
    @hand.map {|card| card.split[0]}
  end

  def get_suit_val
    @hand.map {|card| card.split[-1]}
  end

  def get_numeric_val(card)
    NUMERIC_VAL.each {|key, value|
      return value if key == card
    }
  end

  def get_numeric_hand
    numeric_hand = []
    get_face_val.each { |face_card|
      numeric_hand << get_numeric_val(face_card)
    }
    numeric_hand.sort!
  end

  def count_cards(result, amount)
    @result = []
    face_hand = get_face_val
    face_hand.each { |face_card|
      @result << result if face_hand.count(face_card) == amount
    }
  end

  def gather_pairs
    @result = []
    face_hand = get_face_val
    face_hand.each { |face_card|
      face_hand.count(face_card) == 2 ? @result << "Pair" : @result << "Highest Card"
      face_hand.delete(face_card) if face_hand.count(face_card) == 2
    }
  end
  
end