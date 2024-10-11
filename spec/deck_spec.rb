require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
    describe '#initialize' do
        it 'creates new deck' do
            deck = Deck.new("card")
            expect(deck).to be_an_instance_of(Deck)
        end

        it 'contain all of the cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            expect(deck.cards).to eq(deck.cards)
        end
    end

    describe '#rank_of_card_at' do
        it 'provide rank of card at index 0' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            expect(deck.rank_of_card_at(0)).to eq(12)
        end

        it 'provide rank of card at index 2' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            expect(deck.rank_of_card_at(2)).to eq(14)
        end
    end

    describe '#high_ranking_cards' do
        it 'list of high ranked cards in deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            expect(deck.high_ranking_cards).to eq(deck.high_ranking_cards)
        end
    end

    describe '#percent_high_ranking' do
        it 'provides a % of high ranked cards in the deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            expect(deck.percent_high_ranking).to eq(66.67)
        end
    end

    describe '#remove_card' do
        it 'removes card from deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck = Deck.new([card1, card2, card3])
        deck.remove_card
        expect(deck.cards.count).to eq(2)
        end
    end

    describe '#add_card' do
        it 'adds a card to the deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            card4 = Card.new(:heart, '6', 6)
            deck.add_card(card4)
            expect(deck.cards.count).to eq(4)
        end
    end
end