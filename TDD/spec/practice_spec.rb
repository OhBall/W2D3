require 'rspec'
require 'practice.rb'

describe 'Array' do
  describe '#my_uniq' do
    it 'should return a uniq array' do
      expect([1,2,3,4,5,5,5].my_uniq).to eq([1,2,3,4,5])
    end
  end

  describe '#two_sum' do
    it 'finds all positions where two elements sum to zero' do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'returns smaller first index first' do
      expect([-1, 1, 0, 0].two_sum).to eq([[0, 1], [2, 3]])
    end

  end

  describe '#my_transpose' do
    it 'transposes an array' do
      expect([[0, 1, 2], [3, 4, 5], [6, 7, 8]].my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end
end

describe 'Stock picker' do
  it 'returns the most profitable pair of days' do
    expect(stock_picker([5, 4, 6, 6, 5, 8, 7])).to eq([1, 5])
  end
end
