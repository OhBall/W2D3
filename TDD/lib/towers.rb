require 'byebug'
class Towers
attr_accessor :stacks

  def initialize(size = 4)
    @stacks = Array.new(3) { Array.new }
    (1..size).each do |plate|
      @stacks[0].unshift(plate)
    end
  end

  def get_input
    input = gets.chomp.split(" ").map(&:to_i)
    input
  end

  def move(from, to)
    stacks[to] << stacks[from].pop
  end

  def take_turn
    input = get_input
    from, to = input
    begin
      raise ArgumentError, "Invalid index" unless input.all? { |i| i.between?(0, 2) }

      unless stacks[to].empty?
        if stacks[from].last > stacks[to].last
          raise ArgumentError, "Cannot put a bigger pile on a smaller one"
        end
      end

      raise ArgumentError, "It's an empty pile" if stacks[from].empty?
    rescue ArgumentError => e
      p e.message
      retry
    end
    move(from, to)
  end

  def play
    until won?
      render
      take_turn
    end

    puts "Good"
  end

  def render
    p stacks
  end

  def won?
    return false unless stacks[0].empty?
    stacks[1..2].any? { |stack| stack.empty? }
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Towers.new
  game.play
end
