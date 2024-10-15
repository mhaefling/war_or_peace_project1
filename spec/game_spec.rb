require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/game'

describe Game do
    describe '#initialize' do
        it 'should be a game' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '7', 7)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, 'Ace', 14)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, '3', 3)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            expect(new_game).to be_an_instance_of(Game)
        end

        it 'confirms initial setup of game' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '7', 7)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, 'Ace', 14)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, '3', 3)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            expect(new_game.turn.player1).to eq(player1)
            expect(new_game.turn.player2).to eq(player2)
            expect(new_game.turn.spoils_of_war).to eq([])
        end
    end

    describe '#type' do
        it 'confirms the correct type of round :basic' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '7', 7)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, 'Ace', 14)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, '3', 3)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            expect(new_game.turn.type).to eq(:basic)
        end

        it 'confirms the correct type of round :war' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '7', 7)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, '3', 3)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, 'Ace', 14)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            expect(new_game.turn.type).to eq(:war)
        end

        it 'confirms the correct type of round :mad' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '9', 9)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, '3', 3)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, 'Ace', 14)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            expect(new_game.turn.type).to eq(:mutually_assured_destruction)
        end
    end

    describe '#winner' do
        it 'confirms the winner of the round :basic' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '7', 7)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, 'Ace', 14)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, '3', 3)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            new_game.turn.type
            expect(new_game.turn.winner.name).to eq("Megan")
        end

        it 'confirms the winner of the round :war' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '7', 7)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, '3', 3)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, 'Ace', 14)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            new_game.turn.type
            expect(new_game.turn.winner.name).to eq("Aurora")
        end

        it 'confirms the winner of the round :mad' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '9', 9)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, '3', 3)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, 'Ace', 14)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            new_game.turn.type
            expect(new_game.turn.winner).to eq("No Winner")
        end
    end

    describe '#pile_cards' do
        it 'confirms spoils_of_war and players_decks are updated :basic' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '7', 7)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, 'Ace', 14)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, '3', 3)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            new_game.turn.type
            winner = new_game.turn.winner
            new_game.turn.pile_cards
            expect(new_game.turn.spoils_of_war).to eq([card1, card7])
            expect(new_game.player1.deck.cards).to eq([card2, card3, card4, card5, card6])
            expect(new_game.player2.deck.cards).to eq([card8, card9, card10, card11, card12])
        end

        it 'confirms spoils_of_war and players_decks are updated :war' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '7', 7)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, '3', 3)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, 'Ace', 14)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            new_game.turn.type
            winner = new_game.turn.winner
            new_game.turn.pile_cards
            expect(new_game.turn.spoils_of_war).to eq([card1, card2, card3, card7, card8, card9])
            expect(new_game.player1.deck.cards).to eq([card4, card5, card6])
            expect(new_game.player2.deck.cards).to eq([card10, card11, card12])
        end

        it 'confirms spoils_of_war and players_decks are updated :mad' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '9', 9)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, '3', 3)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, 'Ace', 14)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            new_game.turn.type
            winner = new_game.turn.winner
            new_game.turn.pile_cards
            expect(new_game.turn.spoils_of_war).to eq([])
            expect(new_game.player1.deck.cards).to eq([card4, card5, card6])
            expect(new_game.player2.deck.cards).to eq([card10, card11, card12])
        end
    end

    describe '#award_spoils' do
        it 'confirms cards are added to winners deck and removed from spoils_of_war :basic' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '7', 7)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, 'Ace', 14)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, '3', 3)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            new_game.turn.type
            winner = new_game.turn.winner
            new_game.turn.pile_cards
            new_game.turn.award_spoils(winner)
            expect(new_game.player1.deck.cards).to eq([card2, card3, card4, card5, card6, card1, card7])
            expect(new_game.player2.deck.cards).to eq([card8, card9, card10, card11, card12])
            expect(new_game.turn.spoils_of_war).to eq([])
        end

        it 'confirms cards are added to winners deck and removed from spoils_of_war :war' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '7', 7)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, '3', 3)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, 'Ace', 14)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            new_game.turn.type
            winner = new_game.turn.winner
            new_game.turn.pile_cards
            new_game.turn.award_spoils(winner)
            expect(new_game.player1.deck.cards).to eq([card4, card5, card6])
            expect(new_game.player2.deck.cards).to eq([card10, card11, card12, card1, card2, card3, card7, card8, card9])
            expect(new_game.turn.spoils_of_war).to eq([])
        end

        it 'confirms cards are added to winners deck and removed from spoils_of_war :mad' do
            card1 = Card.new(:spade, 'Ace', 14)
            card2 = Card.new(:heart, '5', 5)
            card3 = Card.new(:club, '9', 9)
            card4 = Card.new(:spade, 'Jack', 11)
            card5 = Card.new(:diamond, '3', 3)
            card6 = Card.new(:heart, 'Queen', 12)
            card7 = Card.new(:diamond, 'Ace', 14)
            card8 = Card.new(:club, '2', 2)
            card9 = Card.new(:diamond, '9', 9)
            card10 = Card.new(:spade, '2', 2)
            card11 = Card.new(:heart, '6', 6)
            card12 = Card.new(:club, '10', 10)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]
            deck1 = Deck.new(cards[0..5])
            deck2 = Deck.new(cards[6..11])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            new_game = Game.new(player1, player2)
            new_game.turn.type
            winner = new_game.turn.winner
            new_game.turn.pile_cards
            new_game.turn.award_spoils(winner)
            expect(new_game.player1.deck.cards).to eq([card4, card5, card6])
            expect(new_game.player2.deck.cards).to eq([card10, card11, card12])
            expect(new_game.turn.spoils_of_war).to eq([])
        end
    end
end
