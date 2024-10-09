require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
    describe '#initialize' do
        it 'creates new deck' do
            deck = Deck.new("card")
            expect(deck).to be_an_instance_of(Deck)
        end

        it 'adds cards to the deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.cards).to eq(cards)
        end

        it 'check rank of card at index 0' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.rank_of_card_at(0)).to eq(12)
        end
        it 'check rank of card at index 2' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.rank_of_card_at(2)).to eq(14)
        end

        it 'check for high ranking cards'
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to eq(@high_ranked_cards)
        end
    end
end