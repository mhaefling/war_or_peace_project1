require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
    attr_reader :player1,
                :player2,
                :turn,

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @turn = Turn.new(player1, player2)
        @round = 0
    end

    def start
        while player1.has_lost? == false || player2.has_lost? == false
            turn.type
            winner = turn.winner
            turn.pile_cards 
            # require 'pry'; binding.pry
            if turn.type == :mutually_assured_destruction
                @round += 1
                puts "Turn #{@round}: *#{turn.type}* - 6 cards removed from play"
            elsif turn.type == :war
                @round += 1
                puts "Turn #{@round}: :#{turn.type} - #{turn.winner.name} won #{turn.spoils_of_war.count} cards."
                turn.award_spoils(winner)
            elsif turn.type == :basic
                @round += 1
                puts "Turn #{@round}: :#{turn.type} - #{turn.winner.name} won #{turn.spoils_of_war.count} cards."
                turn.award_spoils(winner)
            end    
        end
    end
end