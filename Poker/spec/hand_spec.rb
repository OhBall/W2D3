require 'rspec'
require 'hand.rb'

describe 'Hand' do
  subject(:hand) { Hand.new }
  let(:card) {double(:card, suit: :spade, value: 2)}

  describe '#initialize' do
    it 'cards is an empty array' do
      expect(hand.cards).to be_empty
    end
  end

  describe '#add_card' do

    it 'adds a card to the hand' do
      hand.add_card(card)
      expect(hand.cards).to eq([card])
    end

    it 'throws an error if hand is full' do
      5.times { hand.add_card(card) }
      expect{hand.add_card(card)}.to raise_error(FullHandError)
    end
  end

  describe '#full?' do
    it 'returns false if there are less than 5 cards' do
      4.times { hand.add_card(card) }
      expect(hand).to_not be_full
    end

    it 'returns true if there are 5 cards' do
      5.times { hand.add_card(card) }
      expect(hand).to be_full
    end
  end

  describe '#value' do
    it 'returns an array of three' do
      expect(hand.value.length).to be(3)
    end

    it 'the first element of array is a hands type' do
      expect(WINNING_HANDS).to include(hand.value[0])
    end

    it 'the second element of array should be an int' do
      expect(hand.value[1]).to be_a(Integer)
    end

    it 'the third element of array should be an int' do
      expect(hand.value[2]).to be_a(Integer)
    end

    
  end
end
