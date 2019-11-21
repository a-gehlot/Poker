require "player.rb"
require "rspec"

describe "Player" do
    # deck = Deck.new
    subject(:player) { Player.new(Deck.new) }

    describe "#initialize" do

        it "should reduce cards in deck by 5" do
            expect(player.deck.cards.count).to eq(47)
        end

        it "should contain 5 unique instances of cards" do 
            expect(player.player_hand.count).to eq(5)
            expect(player.player_hand.all? { |card| card.is_a?(Card) }).to be true 
            expect(player.player_hand.uniq.count).to eq(5)
        end
        
    end

    describe "#show_cards" do
        specify { expect { player.show_cards }.to output.to_stdout }
    end

    describe "#swap_cards(values)" do 
        it "should swap out cards with new cards from deck" do 
            og_cards = player.player_hand.dup
            player.swap_cards([0,2])
            expect(player.player_hand.count).to eq(5)
            expect(player.player_hand[0]).to_not eq(og_cards[0])
            expect((og_cards - player.player_hand).count).to eq(2)
        end
    end



end