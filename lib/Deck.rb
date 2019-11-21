require_relative "./card.rb"

class Deck
    attr_accessor :cards

    def initialize
        @cards = []
        suits = ["Heart", "Diamond", "Spade", "Club"]
        values = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
        suits.each do |suit|
            values.each do |value|
                @cards << Card.new(value, suit)
            end
        end
    end
    
    def shuffle
        @cards.shuffle!
    end
    
    def deal(number, array)
        number.times { array << @cards.shift } 
        array
    end

end
