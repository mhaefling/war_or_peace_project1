require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
    describe '#initialize' do
        it 'should be a Deck' do
            deck = Deck.new("card")
            expect(deck).to be_an_instance_of(Deck)
        end

        it 'contains three cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.cards).to eq([card1, card2, card3])
        end
    end
    describe '#rank_of_card_at' do
        it 'provide rank of card at index 0' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.rank_of_card_at(0)).to eq(12)
        end

        it 'provide rank of card at index 2' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards) 
            expect(deck.rank_of_card_at(2)).to eq(14)
        end
    end

    describe '#high_ranking_cards' do
        it 'list of high ranked cards in deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card1, card3])
        end

        it 'list of high ranked cards after removing a card' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            deck.cards
            deck.remove_card
            expect(deck.high_ranking_cards).to eq([card3])
        end

    end

    describe '#percent_high_ranking' do
        it 'percent of high ranked cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(66.67)
        end

        it 'percent of high ranked cards after card removal' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            deck.remove_card
            expect(deck.percent_high_ranking).to eq(50.0)
        end

    end

    describe '#remove_card' do
        it 'removes card from deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            deck.remove_card
        expect(deck.cards).to eq([card2, card3])
        end
    end

    describe '#add_card' do
        it 'adds a card to the deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            deck.remove_card
            card4 = Card.new(:club, '5', 5)
            deck.add_card(card4)
            expect(deck.cards).to eq([card2, card3, card4])
        end
    end
end