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



end