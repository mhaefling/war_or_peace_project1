require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
    describe '#initialize' do
        it "Should be a Player" do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            expect(player).to be_an_instance_of(Player)
        end

        it 'have a name' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            expect(player.name).to eq('Clarisa')
        end

        it 'has a deck of cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            expect(player.deck).to eq(deck)
        end

        it 'can remove a players card' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            player.deck.remove_card
            expect(player.deck.cards).to eq([card2, card3])
        end
    end

    describe '#hast_lost?' do
        it 'player has lost?' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            expect(player.has_lost?).to eq(false)
        end

        it 'player has lost when they run out of cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            player.deck.remove_card
            player.deck.remove_card
            player.deck.remove_card
            expect(player.has_lost?).to eq(true)
        end
    end
end