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

    it "should return 'nil' when a hand with no matching face values is passed" do
      hand = EvaluatedHand.new(["10 of D", "9 of H", "2 of S", "King of D", "7 of C"])
      expect(hand.three_of_a_kind?).to eq nil
    end
  end

  describe "#four_of_a_kind?" do
    it "should return '4 of a Kind' when a hand with 4 cards with the same face value is passed" do
      hand = EvaluatedHand.new(["10 of D", "10 of C", "10 of S", "10 of H", "7 of C"])
      expect(hand.four_of_a_kind?).to eq "4 of a Kind"
    end

    it "should return 'nil' when a hand with no matching face values is passed" do
      hand = EvaluatedHand.new(["10 of D", "9 of H", "3 of S", "Queen of D", "5 of C"])
      expect(hand.four_of_a_kind?).to eq nil
    end
  end

  describe "#full_house?" do
    it "should return 'Full House' when a hand with 3 cards with the same face value and 2 cards with the same face value is passed" do
      hand = EvaluatedHand.new(["10 of D", "10 of C", "10 of S", "7 of H", "7 of C"])
      expect(hand.full_house?).to eq "Full House"
    end

    it "should return 'nil' when a hand with no matching face values is passed" do
      hand = EvaluatedHand.new(["10 of D", "9 of H", "3 of S", "Queen of D", "5 of C"])
      expect(hand.full_house?).to eq nil
    end
  end

  describe "#two_pair?" do
    it "should return 'Two Pair' when a hand with 2 sets of 2 cards with the same face value is passed" do
      hand = EvaluatedHand.new(["10 of D", "10 of C", "8 of S", "7 of H", "7 of C"])
      expect(hand.two_pair?).to eq "Two Pair"
    end

    it "should return 'nil' when a hand with no matching face values is passed" do
      hand = EvaluatedHand.new(["10 of D", "9 of H", "3 of S", "Queen of D", "5 of C"])
      expect(hand.two_pair?).to eq nil
    end
  end

  describe "#flush?" do
    context "when passed a hand with all the same suit values" do
      it "should return 'Flush' when all suits are 'D'" do
        hand = EvaluatedHand.new(["10 of D", "5 of D", "8 of D", "7 of D", "Ace of D"])
        expect(hand.flush?).to eq "Flush"
      end

      # it "should return 'Flush' when all suits are 'C'" do
      #   hand = EvaluatedHand.new(["10 of C", "5 of C", "8 of C", "7 of C", "Ace of C"])
      #   expect(hand.flush?).to eq "Flush"
      # end
    end

    it "should return 'nil' when a hand with no matching face values is passed" do
      hand = EvaluatedHand.new(["10 of D", "9 of D", "3 of S", "Queen of D", "5 of D"])
      expect(hand.flush?).to eq nil
    end
  end
end