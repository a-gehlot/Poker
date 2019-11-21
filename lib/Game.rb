require_relative "./player.rb"
require_relative "./card.rb"

class Game
    attr_reader :return_card_val

    include Hand

    RANKINGS = {
        :royal_flush? => 1,
        :straight_flush? => 2,
        :four_of_kind? => 3,
        :full_house? => 4,
        :flush? => 5,
        :straight? => 6,
        :three_of_kind? => 7,
        :two_pair? => 8,
        :pair? => 9,
        :high_card? => 10
    }

    def initialize
        @players = []
        @deck = Deck.new
        @return_card_val = []
    end

    def make_players
        puts "enter number of players"
        num = gets.chomp.to_i
        num.times { @players << Player.new(@deck) }
    end

    def get_rank
        @players.each do |player|
            @return_card_val << self.check_rank(player)
        end
    end

    def check_rank(player)
        return_val = []
        RANKINGS.keys.each do |methodName|
            return_val = [RANKINGS[methodName], self.send(methodName, player.player_hand)]
            break unless return_val[1] == false
        end
        return_val
    end

    def find_winner
        top_rank = 0
        top_val = 0
        @return_card_val.each do |rank, val|
            next unless rank > top_rank
            top_rank = rank 
            next unless rank == top_rank
            top_val = val 
        end

        puts "the winner is player number #{@return_card_val.index([top_rank, top_val]) + 1}"
    end



end

