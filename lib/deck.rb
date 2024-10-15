require './lib/card'

# Defining Deck class to hold each players deck of cards

class Deck
    attr_reader :cards

    def initialize(cards)
        # Each deck holds an array of cards
        @cards = cards
    end

    # Return the rank of the card at the given index value
    def rank_of_card_at(index)
        @cards[index].rank
    end

    # Return an array of all the cards with a rank that is greater than or equal to 11
    def high_ranking_cards
        @cards.select do |card|
            card.rank >=11
        end
    end

    # Return a float providing the percent of high ranked cards in the players deck
    def percent_high_ranking
        percent_high_rank = high_ranking_cards.count.to_f / cards.count.to_f * 100
        percent_high_rank.round(2)
    end

    # Removes a card from the players deck at index 0
    def remove_card
        @cards.shift
    end

    # Addes a card to the players deck at the highest index
    def add_card(card)
        @cards.append(card)
    end
end