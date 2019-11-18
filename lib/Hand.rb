require_relative "./Deck.rb"

class Hand
    def same_suit?(cards)
        cards.all? { |card| card.suit == cards[0].suit }
    end

    def in_order?(cards)
        sorted = []
        cards.each { |card| sorted << card.value}
        sorted.flatten!.sort!
        if sorted.count <= 5
            return (sorted.first..sorted.last).to_a == sorted
        else
            return continguous?((sorted.first..sorted.last).to_a - sorted)
        end
    end

    def continguous?(arr)
        a = arr.sort
        (a.first..a.last).to_a == a
    end

    def straight_flush?(cards)
        self.same_suit?(cards) && self.in_order?(cards)
    end

    def royal_flush?(cards)
        self.straight_flush?(cards) && cards.inject(0) { |sum, p| sum + p.value.sum } == 61
    end

    def straight?(cards)
        self.in_order?(cards)
    end

    

end