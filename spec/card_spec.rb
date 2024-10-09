require 'rspec'
require './lib/card'

describe Card do
  describe '#initialize' do
    it "card is an instance of card"
      card = Card.new(:heart, 'Jack', 11) do
        expect(card).to be_an_instance_of(Card)
    end

    it "card should have the suit of a heart" do
      card = Card.new(:heart, 'Jack', 11)
      expect(card.suit).to eq(:heart)
    end

    it "card should have a value of jack" do
      card = Card.new(:heart, 'Jack', 11)
      expect(card.value).to eq('Jack')
    end

    it "card should have a rank of 11" do
      card = Card.new(:heart, 'Jack', 11)
      expect(card.rank).to eq(11)
    end
  end
end
