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

    def get_swap
        swap_values = []
        puts "select card spot, separated by a comma"
        swap_values << gets.chomp.split(',')
        if swap_values.include?("none")
            return
        else
            swap_values.pop.map! { |i| i.to_i - 1 }
            swap_cards(swap_values)
        end
    end



end