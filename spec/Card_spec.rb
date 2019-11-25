require "card.rb"
require "rspec"

describe "Card" do
    subject(:card) { Card.new(4, "heart") }
    
    describe "#initialize" do
        it "should create a card with value and suit" do
            expect(card.value).to include(4)
            expect(card.suit).to eq("heart")
        end
        
        it "should allow face cards" do
            king = Card.new("K", "heart")
            ace = Card.new("A", "heart")
            expect(king.value).to include(13)
            expect(ace.value).to include(14, 1)
        end
    end

end

    