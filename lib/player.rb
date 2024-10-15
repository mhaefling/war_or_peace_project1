require './lib/card'
require './lib/deck'

# Defining Player class to hold all players attributes/values.

class Player
    attr_reader :name,
                :deck

    def initialize(name, deck)
        # Each player has a name.
        @name = name
        # Each player has a deck of cards.
        @deck = deck
    end

    # Returns if player has lost by checking if they have ran out of cards in their deck
    def has_lost?
        deck.cards.empty?
    end
end