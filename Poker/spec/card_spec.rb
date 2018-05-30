require 'rspec'
require 'card.rb'

describe "Card" do
  subject(:card) {Card.new(:club,1)}
  describe '#initialize' do
    it "has a suit" do
      expect(card.suit).to eq(:club)
    end

    it 'has a number value' do
      expect(card.value).to eq(1)
    end
  end
end
