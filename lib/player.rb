require './lib/card'
require './lib/deck'

# Defining Player class to hold all player details

class Player
    attr_reader :name,
                :deck

    def initialize(name, deck)
        @name = name
        @deck = deck
        @has_lost = false
    end

    # Returns of player has lost by checking if they have ran out of cards in their deck
    def has_lost?
        if deck.cards.count > 0
            @hast_lost = false
        else
            @hast_lost = true
        end
    end
end