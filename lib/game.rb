require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
    attr_reader :player1,
                :player2,
                :turn

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @turn = Turn.new(player1, player2)
        @round = 0
    end

    def start
        until @player1.has_lost? == true || @player2.has_lost? == true || @round == 1000001 do
            @round +=1
            turn_type = @turn.type
            winner = @turn.winner
            @turn.pile_cards
            if @round == 1000001
                puts "---- DRAW ----"

            elsif @turn.spoils_of_war.count == 0
                puts "Turn #{@round}: *#{turn_type}* - 6 cards removed from play"

            elsif @turn.spoils_of_war.count == 2
                puts "Turn #{@round}: :#{turn_type} - #{winner.name} won 2 cards."
                @turn.award_spoils(winner)

            elsif @turn.spoils_of_war.count == 6
                puts "Turn #{@round}: :#{turn_type} - #{winner.name} won 6 cards."
                @turn.award_spoils(winner)
            end
        end
        if @player1.has_lost? == true
            puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        elsif @player2.has_lost? == true
            puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        end
    end
end