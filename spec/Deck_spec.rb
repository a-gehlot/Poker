require "deck.rb"
require "rspec"

describe "Deck" do
    subject(:deck) { Deck.new }

    describe "#initialize" do
        it "should create 52 cards" do
            expect(deck.cards.count).to eq(52)
        end

        it "should hold instances of card class" do
            expect(deck.cards.all? { |card| card.is_a?(Card) }).to be true
        end
    end
end