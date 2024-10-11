require './lib/card'
require './lib/deck'
require './lib/player'

class Player
    attr_reader :name,
                :deck

    def initialize(name, deck)
        @name = name
        @deck = deck
        @has_lost = false
    end

    def has_lost?
        if deck.cards.count > 0
            @hast_lost = false
        else
            @hast_lost = true
        end
    end
end