require 'rspec'
require './lib/card'

describe Card do
  describe '#initialize' do

    it "card is an instance of card" do
      card = Card.new(:heart, 'Jack', 11)
      expect(card).to be_an_instance_of(Card)
    end

    it "has a suit, value, rank" do
      card = Card.new(:heart, 'Jack', 11)
      expect(card.suit).to eq(:heart)
      expect(card.value).to eq('Jack')
      expect(card.rank).to eq(11)
    end
  end
end
