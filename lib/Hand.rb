require_relative "./Deck.rb"

module Hand

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
        return self.return_high_card(values_array(cards)) if self.same_suit?(cards) && self.in_order?(cards) 
        false
    end

    def royal_flush?(cards)
        self.straight_flush?(cards) && self.card_value_sum(cards) == 61
    end

    def straight?(cards)
        if self.in_order?(cards)
            return return_high_card(values_array(cards))
        end
        false
    end

    def return_high_card(card_values)
        low_straight = [1,14,2,3,4,5]
        if card_values.count == 6 #includes ace
            if (card_values - low_straight).empty?
                return 5
            else
                return 14
            end
        end

        card_values.max
    end

    def four_of_kind?(cards)
        count_duplicates(self.values_array(cards)).any? do |k, v|
            if v == 4
                return k
            end
        end
        # isolated = self.remove_non_dups(self.values_array(cards))
        # return_high_card(isolated)
        false
    end

    def count_duplicates(array)
        dups = Hash.new(0)
        array.each { |v| dups[v] += 1 }
        dups
    end

    def values_array(cards)
        if cards.all? { |card| card.is_a?(Integer) }
            return cards 
        else
            values = []
            cards.each { |card| values << card.value }
            return values.flatten
        end
    end

    def card_value_sum(cards)
        cards.inject(0) { |sum, p| sum + p.value.sum }
    end

    def remove_non_dups(array)
        array - array.uniq
    end

    def three_of_kind?(cards)
        count_duplicates(self.values_array(cards)).any? do |k, v|
            if v == 3
                return k 
            end
        end
        false
    end

    def pair?(cards)
        count_duplicates(self.values_array(cards)).any? do |k, v|
            if v == 2
                return k 
            end
        end 
        false
    end


    def full_house?(cards)
        if self.three_of_kind?(cards) && self.pair?(cards) && self.three_of_kind?(cards) != self.pair?(cards) 
            return self.three_of_kind?(cards)
        end
        false
    end

    def two_pair?(cards)
        self.pair?(cards) ? (first = self.pair?(cards)) : (return false)
        remaining = self.values_array(cards)
        2.times do 
            remaining.delete(first)
        end
        self.pair?(remaining) ? second = (self.pair?(remaining)) : (return false)
        
        first > second ? (return first) : (return second)
    end

    def high_card?(cards)
        self.return_high_card(self.values_array(cards))
    end

    def flush?(cards)
        if self.same_suit?(cards)
            return return_high_card(self.values_array(cards))
        end
        false
    end








end