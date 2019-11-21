require_relative "./hand.rb"

class Player

    attr_accessor :deck, :player_hand

    def initialize(deck)
        @deck = deck
        @deck.shuffle
        @player_hand = @deck.deal(5, Array.new)
    end

    def show_cards
        @player_hand.each { |card| puts card.name }
    end

    def swap_cards(array)
        array.each { |index| @player_hand.delete_at(index) }
        @deck.deal(array.count, @player_hand)
    end



end