class EvaluatedHand
  def initialize(hand)
    @hand = hand
    @result = []
  end

  def pair?
    face_hand = get_face_val
    face_hand.each { |face_card|
      face_hand.count(face_card) == 2 ? @result << "Pair" : @result << "Highest Card"
    }
    @result.include?("Pair") ? "Pair" : "Highest Card"
  end

  def get_face_val
    @hand.map {|card| card.split[0]}
  end

  def three_of_a_kind?
    face_hand = get_face_val
    face_hand.each { |face_card|
    @result << "3 of a Kind" if face_hand.count(face_card) == 3
  }
  @result[0] if @result.length > 0
  end

  
end