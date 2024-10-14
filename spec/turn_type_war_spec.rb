require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
    describe '#initialize' do
        it 'confirms initial setup' do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)    
            card3 = Card.new(:heart, '9', 9)    
            card4 = Card.new(:diamond, 'Jack', 11)    
            card5 = Card.new(:heart, '8', 8)    
            card6 = Card.new(:diamond, 'Queen', 12)    
            card7 = Card.new(:heart, '3', 3)    
            card8 = Card.new(:diamond, '2', 2)    
            deck1 = Deck.new([card1, card2, card5, card8])    
            deck2 = Deck.new([card3, card4, card6, card7])    
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)
            expect(turn.player1).to eq(player1)
            expect(turn.player2).to eq(player2)
            expect(turn.spoils_of_war).to eq([])
        end
    end

    describe '#type' do
        it 'confirms the type of turn :war' do
            card1 = Card.new(:heart, 'Jack', 11)    
            card2 = Card.new(:heart, '10', 10)    
            card3 = Card.new(:heart, '9', 9)    
            card4 = Card.new(:diamond, 'Jack', 11)    
            card5 = Card.new(:heart, '8', 8)    
            card6 = Card.new(:diamond, 'Queen', 12)    
            card7 = Card.new(:heart, '3', 3)    
            card8 = Card.new(:diamond, '2', 2)    
            deck1 = Deck.new([card1, card2, card5, card8])    
            deck2 = Deck.new([card4, card3, card6, card7])    
            player1 = Player.new("Megan", deck1)    
            player2 = Player.new("Aurora", deck2)    
            turn = Turn.new(player1, player2)
            expect(turn.type).to eq(:war)
        end
    end

    describe '#winner' do
        it ':war confirms the winner of the turn' do
            card1 = Card.new(:heart, 'Jack', 11)    
            card2 = Card.new(:heart, '10', 10)    
            card3 = Card.new(:heart, '9', 9)    
            card4 = Card.new(:diamond, 'Jack', 11)    
            card5 = Card.new(:heart, '8', 8)    
            card6 = Card.new(:diamond, 'Queen', 12)    
            card7 = Card.new(:heart, '3', 3)    
            card8 = Card.new(:diamond, '2', 2)    
            deck1 = Deck.new([card1, card2, card5, card8])    
            deck2 = Deck.new([card4, card3, card6, card7])    
            player1 = Player.new("Megan", deck1)    
            player2 = Player.new("Aurora", deck2)    
            turn = Turn.new(player1, player2) 
            turn.type
            winner = turn.winner
            expect(turn.winner).to eq(player2)
        end
    end

    describe '#pile_cards' do
        it 'adds players cards to spoils_of_war and removes cards from players deck' do
            card1 = Card.new(:heart, 'Jack', 11)    
            card2 = Card.new(:heart, '10', 10)    
            card3 = Card.new(:heart, '9', 9)    
            card4 = Card.new(:diamond, 'Jack', 11)    
            card5 = Card.new(:heart, '8', 8)    
            card6 = Card.new(:diamond, 'Queen', 12)    
            card7 = Card.new(:heart, '3', 3)    
            card8 = Card.new(:diamond, '2', 2)    
            deck1 = Deck.new([card1, card2, card5, card8])    
            deck2 = Deck.new([card4, card3, card6, card7])    
            player1 = Player.new("Megan", deck1)    
            player2 = Player.new("Aurora", deck2)    
            turn = Turn.new(player1, player2) 
            turn.type
            winner = turn.winner
            turn.pile_cards
            expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
            expect(player1.deck.cards).to eq([card8])
            expect(player2.deck.cards).to eq([card7])
        end
    end

    describe '#spoils_of_war' do
        it ':war confrims players cards are added to spoils of war' do
            card1 = Card.new(:heart, 'Jack', 11)    
            card2 = Card.new(:heart, '10', 10)    
            card3 = Card.new(:heart, '9', 9)    
            card4 = Card.new(:diamond, 'Jack', 11)    
            card5 = Card.new(:heart, '8', 8)    
            card6 = Card.new(:diamond, 'Queen', 12)    
            card7 = Card.new(:heart, '3', 3)    
            card8 = Card.new(:diamond, '2', 2)    
            deck1 = Deck.new([card1, card2, card5, card8])    
            deck2 = Deck.new([card4, card3, card6, card7])    
            player1 = Player.new("Megan", deck1)    
            player2 = Player.new("Aurora", deck2)    
            turn = Turn.new(player1, player2) 
            turn.type
            winner = turn.winner
            turn.pile_cards
            expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
        end
    end

    describe '#award_spoils' do
        it ':war gives the winner all six cards' do
            card1 = Card.new(:heart, 'Jack', 11)    
            card2 = Card.new(:heart, '10', 10)    
            card3 = Card.new(:heart, '9', 9)    
            card4 = Card.new(:diamond, 'Jack', 11)    
            card5 = Card.new(:heart, '8', 8)    
            card6 = Card.new(:diamond, 'Queen', 12)    
            card7 = Card.new(:heart, '3', 3)    
            card8 = Card.new(:diamond, '2', 2)    
            deck1 = Deck.new([card1, card2, card5, card8])    
            deck2 = Deck.new([card4, card3, card6, card7])    
            player1 = Player.new("Megan", deck1)    
            player2 = Player.new("Aurora", deck2)    
            turn = Turn.new(player1, player2) 
            turn.type
            winner = turn.winner
            turn.pile_cards
            turn.spoils_of_war
            turn.award_spoils(winner)
            expect(player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
            expect(turn.spoils_of_war).to eq([])
        end
    end
end 