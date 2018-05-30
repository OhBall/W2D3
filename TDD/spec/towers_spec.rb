require 'rspec'
require 'towers.rb'

describe 'Towers of Hanoi' do
  subject(:game) { Towers.new }
  describe '#initialize' do
    it 'has a set of 3 arrays' do
      expect(game.stacks.length).to be(3)
    end

    it 'starts with 1 full stack and 2 empty stacks' do
      expect(game.stacks[0].length).to be(4)
      expect(game.stacks[1].length).to be(0)
      expect(game.stacks[2].length).to be(0)
    end

    it 'first stack should be piled up correctly' do
      expect(game.stacks[0]).to eq(game.stacks[0].sort.reverse)
    end

  end

  describe "#move" do
    it "moves from one pile to another" do
      game.move(0,1)
      expect(game.stacks[0]).to eq([4,3,2])
      expect(game.stacks[1]).to eq([1])
    end
  end


  describe '#won?' do
    context 'game is not over' do
      it 'returns false if the game is not over' do
        expect(game).to_not be_won
      end
    end

    let(:won_game) { Towers.new }
    context 'game is over' do
      it 'returns true if the game is over' do
        won_game.stacks = [[], [4, 3, 2, 1], []]
        expect(won_game).to be_won
      end
    end
  end

  # describe '#take_turn' do
  #   it 'raises an ArgumentError if input is an invalid index' do
  #     allow(game).to receive(:get_input).and_return([-1, 1])
  #     expect { game.take_turn }.to raise_error(ArgumentError)
  #   end
  #
  #   it 'raises an ArgumentError if you try to put a bigger piece onto a smaller piece' do
  #     allow(game).to receive(:get_input).and_return([0, 1])
  #     game.take_turn
  #     expect { game.take_turn }.to raise_error(ArgumentError)
  #   end
  #
  #   it 'raises an ArgumentError if you try to move from an empty pile' do
  #   end
  # end

end
