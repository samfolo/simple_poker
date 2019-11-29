class EvaluatedHand
  def initialize(hand)
    @hand = hand
    @result = []
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

  # def flush?

  # end

  private

  def get_face_val
    @hand.map {|card| card.split[0]}
  end

  # def get_suit_val
  #   @hand.map {|card| card.split[0]}
  # end

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