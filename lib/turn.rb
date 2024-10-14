require './lib/card'
require './lib/deck'
require './lib/player'

# Defining Turn class to check the type of turn, the winner of the turn and re-arrange cards

class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war
                :winner

    def initialize(player1, player2)
        # player1 variable holds player1's attributes, deck, cards
        @player1 = player1
        # player2 variable holds player1's attributes, deck, cards
        @player2 = player2
        # spoils_of_war array starts empty as cards get added to it turning each turn
        @spoils_of_war = []
        @winner = nil
    end

    # Returns the type of turn based on users card ranks
    def type
        # defined varibles with users playable cards to make code more readable.
        @player1_top_card = player1.deck.cards[0].rank
        @player1_third_card = player1.deck.cards[2].rank
        @player2_top_card = player2.deck.cards[0].rank
        @player2_third_card = player2.deck.cards[2].rank
        
        # Compares both players cards at index 0 and index 2 to determine if they're both the same rank if true turn type is mutual assured destruction
        if @player1_top_card == @player2_top_card && @player1_third_card == @player2_third_card
            @type = :mutually_assured_destruction

        # Compares both players cards at index 0 to determine if they're both the same rank if true turn type is war
        elsif @player1_top_card == @player2_top_card
            @type = :war
        
        # Compares both players cards at index 0 to determine if they're NOT the same rank if true turn type is basic
        elsif @player1_top_card != @player2_top_card
            @type = :basic
        end
        @type
    end

    # Returns who the winner of each turn is
    def winner
        @winner = nil
        
        # Checks the type of turn with a while statement and then compares card ranks to determine winner
        while @type == :basic
            if @player1_top_card > @player2_top_card
                @winner = @player1
            elsif @player1_top_card < @player2_top_card
                @winner = @player2
            end
            break
        end
        
        # Checks the type of turn with a while statement and then compares card ranks to determine winner
        while @type == :war
            if @player1_third_card > @player2_third_card
                @winner = @player1
            elsif @player1_third_card < @player2_third_card
                @winner = @player2
            end
            break
        end

        # Confirms no winner of type returns mutually assured destruction
        while @type == :mutually_assured_destruction
            @winner = "No Winner"
            break
        end
        @winner

        ###########################THIS CODE MAY NO LONGER BE NEEDED#########################
        # if @type == :basic && @player1_top_card > @player2_top_card
        #     @winner = player1
        # elsif @type == :basic && @player1_top_card < @player2_top_card
        #     @winner = player2
        # elsif @type == :war && @player1_third_card > @player2_third_card
        #     @winner = player1
        # elsif @type == :war && @player1_third_card < @player2_third_card
        #     @winner = player2
        # elsif @type == :mutually_assured_destruction
        #     @winner = "No Winner"
        # end
        ####################################################################################
    end

    # Submits all players cards to the spoils of war array and removes the cards from the players decks
    # look into find for the basic, and look into index.select using each on type war, look into .times on mutually assured destruction.
    def pile_cards
        if @type == :basic
            @player1.deck.cards.select do |card|
                @spoils_of_war << card if card == @player1.deck.cards[0]
            end
            @player2.deck.cards.select do |card|
                @spoils_of_war << card if card == @player2.deck.cards[0]
            end
            @player1.deck.remove_card
            @player2.deck.remove_card

        elsif @type == :war
            @player1.deck.cards.map do |card|
                @spoils_of_war << card if card == @player1.deck.cards[0]
                @spoils_of_war << card if card == @player1.deck.cards[1]
                @spoils_of_war << card if card == @player1.deck.cards[2]
            end
            @player2.deck.cards.map do |card|
                @spoils_of_war << card if card == @player2.deck.cards[0]
                @spoils_of_war << card if card == @player2.deck.cards[1]
                @spoils_of_war << card if card == @player2.deck.cards[2]
            end
            @player1.deck.remove_card
            @player1.deck.remove_card
            @player1.deck.remove_card
            @player2.deck.remove_card
            @player2.deck.remove_card
            @player2.deck.remove_card

        elsif @type == :mutually_assured_destruction
            @player1.deck.remove_card
            @player1.deck.remove_card
            @player1.deck.remove_card
            @player2.deck.remove_card
            @player2.deck.remove_card
            @player2.deck.remove_card
        end
    end

    # Moves all the cards from the spoils of war array into the winners deck, and clears the spoils of war aray for the next round.
    def award_spoils(player)
        @spoils_of_war.each do |card|
            player.deck.add_card(card)
        end
        @spoils_of_war.clear
    end
end