# require "simple_poker"

# RSpec.describe create_deck do

#   it "contains 52 cards" do
#     expect(subject.length).to eq 52
#   end

# end

# # RSpec.describe get_random_card do

# #   it "gives random valid card" do
# #     expect(create_deck.include?(subject)).to eq true
# #   end

# #   after do
# #     puts subject
# #   end

# # end

# RSpec.describe cuts(create_deck) do 

#   it "returns an array" do
#     expect(subject).to be_an_instance_of(Array)
#   end

#   it "should return an array shorter than 52" do
#     expect(subject.length).to eq 52
#   end

# end

# # cards = {Hearts: [], Clubs: [], Spades: [], Diamonds: []}

# # cards.each { |k, v|
# #   v.push(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "k", "q", "j", "a")
# # }

# # puts cards
