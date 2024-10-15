require './lib/card'
require './lib/deck'
require './lib/player'

# Defining Turn class to check the type of turn, the winner of the turn, compare and re-arrange cards

class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war

    def initialize(player1, player2)
        # player1 variable holds player1's attributes, name, deck, cards
        @player1 = player1
        # player2 variable holds player1's attributes, name, deck, cards
        @player2 = player2
        # spoils_of_war array starts empty as cards get added to it during each turn
        @spoils_of_war = []
    end

    # Returns the type of turn based on users card ranks
    def type
      
        # Compares both players cards at index 0 and index 2 to determine if they're both the same rank if true turn type is mutual assured destruction
        if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            @type = :mutually_assured_destruction

        # Compares both players cards at index 0 to determine if they're both the same rank if true turn type is war
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
            @type = :war
        
        # Compares both players cards at index 0 to determine if they're NOT the same rank if true turn type is basic
        elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            @type = :basic
        end
    end

    # Returns who the winner of each turn is
    def winner
        if @type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            @player1

        elsif @type == :basic && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
            @player2

        elsif @type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
            @player1

        elsif @type == :war && @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
            @player2

        elsif @type == :mutually_assured_destruction
            "No Winner"
        end
    end

    # Submits all players cards to the spoils of war array and removes the cards from the players decks
    def pile_cards
        if @type == :basic
            @spoils_of_war << @player1.deck.remove_card
            @spoils_of_war << @player2.deck.remove_card

        elsif @type == :war
            3.times do
                @spoils_of_war << @player1.deck.remove_card
            end
            3.times do 
                @spoils_of_war << @player2.deck.remove_card
            end

        elsif @type == :mutually_assured_destruction
            3.times do
                @player1.deck.remove_card
            end
            3.times do
                @player2.deck.remove_card
            end
        end
    end

    # Moves all the cards from the spoils of war array into the winners deck, and clears the spoils of war aray for the next round.
    def award_spoils(player)
        # @spoils_of_war.shuffle!
        if player == "No Winner"
            @spoils_of_war.clear
        else
            player.deck.cards.concat(@spoils_of_war)
            @spoils_of_war.clear
        end
    end
end