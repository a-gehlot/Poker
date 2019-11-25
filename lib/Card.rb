class Card
    attr_accessor :value, :suit, :name

    FACE_VALUES = { "J" => [11], "Q" => [12], "K" => [13], "A" => [1, 14] }

    def initialize(value, suit)
        if value.is_a?(Integer)
            @value = [value]
        else
            @value = FACE_VALUES[value]
        end
        @suit = suit
        @name = "#{value} of #{suit}"
    end


end