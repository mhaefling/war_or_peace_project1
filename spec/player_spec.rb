require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
    describe '#initialize' do
        it "player should be a Player" do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player1 = Player.new('Matt', deck)
            expect(player1).to be_an_instance_of(Player)
        end

        it 'player has a name' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player1 = Player.new('Matt', deck)
            expect(player1.name).to eq('Matt')
        end

        it 'player should have a deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player1 = Player.new('Matt', deck)
            expect(player1.deck.cards.empty?).to eq(false)
        end
    end

    describe '#initialize' do
        it 'check if player has lost' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player1 = Player.new('Matt', deck)
            expect(player1.has_lost?).to eq(false)
        end
    end
end