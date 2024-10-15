# Defining Card class to hold the attributes/values of each card.

class Card
    attr_reader :suit,
                :value,
                :rank

    def initialize(suit, value, rank)
        # Each card has suit
        @suit = suit
        # Each card has a value
        @value = value
        # Each card has a rank
        @rank = rank
    end
end