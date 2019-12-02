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

  def three_of_a_kind?
  count_cards("3 of a Kind", 3)
  @result[0]
  end

  def four_of_a_kind?
  count_cards("4 of a Kind", 4)
  @result[0]
  end

  def full_house?
    "Full House" if three_of_a_kind? && pair? == "Pair"
  end

  def two_pair?
    gather_pairs
    "Two Pair" if @result.count("Pair") == 2
  end

  def flush?
    suit_hand = get_suit_val
    "Flush" if suit_hand.uniq.length == 1
  end

  def straight?
    numeric_hand = get_numeric_hand
    i = 0
    pre_card = ""
    numeric_hand.each { |card|
      (i += 1 if pre_card == card.to_i - 1)  if pre_card != ""
      pre_card = card
    }
    "Straight" if i == 4
  end

  def straight_flush?
    "Straight Flush" if straight? == "Straight" && flush? == "Flush"
  end

  def royal_flush?
    "Royal Flush" if straight_flush? && get_numeric_hand[0] == 9
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
    face_hand = get_face_val
    face_hand.each { |face_card|
      @result << result if face_hand.count(face_card) == amount
    }
  end

  def gather_pairs
    face_hand = get_face_val
    face_hand.each { |face_card|
      face_hand.count(face_card) == 2 ? @result << "Pair" : @result << "Highest Card"
      face_hand.delete(face_card) if face_hand.count(face_card) == 2
    }
  end
  
end