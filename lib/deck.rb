require './lib/card'
require './lib/deck'
require './lib/player'

class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        @index = @cards[index].rank
    end

    def high_ranking_cards
        @high_ranked_cards = @cards.select do |card|
            card.rank >= 11
        end
    end

    def percent_high_ranking
        high_cards = high_ranking_cards.count.to_f
        card_count = @cards.count.to_f
        high_rank_percent = high_cards / card_count * 100
        p high_rank_percent.round(2)
    end

    def remove_card
        @cards.shift
    end

    def add_card(card)
        @cards.append(card)
    end
end