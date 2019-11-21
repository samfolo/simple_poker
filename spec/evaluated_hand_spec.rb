require "evaluated_hand"

describe EvaluatedHand do
  describe "#pair?" do
    it "should return 'Pair' when a hand with 2 cards with the same face value is passed" do
      hand = EvaluatedHand.new(["10 of D", "10 of C", "2 of S", "King of D", "7 of C"])
      expect(hand.pair?).to eq "Pair"
    end

    it "should return 'Highest Card' when a hand with no matching face values is passed" do
      hand = EvaluatedHand.new(["10 of D", "9 of H", "2 of S", "King of D", "7 of C"])
      expect(hand.pair?).to eq "Highest Card"
    end
  end

  describe "#three_of_a_kind?" do
    it "should return '3 of a Kind' when a hand with 3 cards with the same face value is passed" do
      hand = EvaluatedHand.new(["10 of D", "10 of C", "10 of S", "King of D", "7 of C"])
      expect(hand.three_of_a_kind?).to eq "3 of a Kind"
    end
  end
end