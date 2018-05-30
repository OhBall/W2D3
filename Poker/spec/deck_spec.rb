require 'rspec'
require 'deck.rb'

describe 'Deck' do
  subject(:deck) {Deck.new}
  describe '#initialize' do
    it 'has 52 cards to begin with' do
      expect(deck.cards.length).to eq(52)
    end

    it 'shuffles the cards' do
      expect(deck.cards).to_not eq(deck.cards.sort_by { |card| card.value })
    end
  end

  describe '#draw' do
    it 'returns a card' do
      expect(deck.draw).to be_a(Card)
    end

    it 'removes the card drawn from the deck' do
      deck.draw
      expect(deck.cards.length).to be(51)
    end

    it 'should throw an error if no cards are in the deck' do
      52.times { deck.draw }
      expect { deck.draw }.to raise_error(EmptyDeckError)
    end
  end
end
