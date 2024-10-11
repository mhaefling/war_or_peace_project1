require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        @player1_top_card = player1.deck.cards[0].rank
        @player2_top_card = player2.deck.cards[0].rank

        if @player1_top_card == @player2_top_card && player1.deck.cards[2].rank == player2.deck.cards[2].rank
            @type = :mutually_assured_destruction
        elsif @player1_top_card == @player2_top_card
            @type = :war
        elsif @player1_top_card != @player2_top_card
            @type = :basic
        end
        @type
    end

    def winner
        @winner = nil
        while @type == :basic
            if @player1_top_card > @player2_top_card
                @winner = player1
            elsif @player1_top_card < @player2_top_card
                @winner = player2
            end
            break
        end
        while @type == :war
            if player1.deck.cards[2].rank > player2.deck.cards[2].rank
                @winner = player1
            elsif player1.deck.cards[2].rank < player2.deck.cards[2].rank
                @winner = player2
            end
            break
        end
        while @type == :mutually_assured_destruction
            @winner = "No Winner"
            break
        end
        @winner

        ###########################THIS CODE MAY NO LONGER BE NEEDED#########################
        ### First attempt was resulting in turn.pile_cards to collect 4 cards instead of 2.
        # if @type == :basic && @player1_top_card > @player2_top_card
        #     @winner = player1
        # elsif @type == :basic && @player1_top_card < @player2_top_card
        #     @winner = player2
        # elsif @type == :war && player1.deck.cards[2].rank > player2.deck.cards[2].rank
        #     @winner = player1
        # elsif @type == :war && player1.deck.cards[2].rank < player2.deck.cards[2].rank
        #     @winner = player2
        # elsif @type == :mutually_assured_destruction
        #     @winner = "No Winner"
        # end
        ####################################################################################
    end

    def pile_cards
        @spoilers_of_war = []
        if @type == :basic
            player1.deck.cards.map do |card|
                @spoils_of_war << card if card == player1.deck.cards[0]
            end
            player2.deck.cards.map do |card|
                @spoils_of_war << card if card == player2.deck.cards[0]
            end
            player1.deck.remove_card
            player2.deck.remove_card
        elsif @type == :war
            player1.deck.cards.map do |card|
                @spoils_of_war << card if card == player1.deck.cards[0]
                @spoils_of_war << card if card == player1.deck.cards[1]
                @spoils_of_war << card if card == player1.deck.cards[2]
            end
            player2.deck.cards.map do |card|
                @spoils_of_war << card if card == player2.deck.cards[0]
                @spoils_of_war << card if card == player2.deck.cards[1]
                @spoils_of_war << card if card == player2.deck.cards[2]
            end
            player1.deck.remove_card
            player1.deck.remove_card
            player1.deck.remove_card
            player2.deck.remove_card
            player2.deck.remove_card
            player2.deck.remove_card
        elsif @type == :mutually_assured_destruction
            player1.deck.remove_card
            player1.deck.remove_card
            player1.deck.remove_card
            player2.deck.remove_card
            player2.deck.remove_card
            player2.deck.remove_card
        end
    end

    def award_spoils(player)
        @spoils_of_war.each do |card|
            player.deck.add_card(card)
        end
    end
end