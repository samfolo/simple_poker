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
end