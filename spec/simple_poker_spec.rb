require "simple_poker"

RSpec.describe create_deck do 

  it "contains 52 cards" do
    expect(subject.length).to eq 52
  end

end

RSpec.describe "card" do
  let(:card) { { suit: "Hearts", value: "King" } }

  it "has a value" do
    expect(card[:suit]).to eq "Hearts"
    expect(card[:value]).to eq "King"
  end

end

# cards = {Hearts: [], Clubs: [], Spades: [], Diamonds: []}

# cards.each { |k, v| 
#   v.push(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "k", "q", "j", "a")
# }

# puts cards
