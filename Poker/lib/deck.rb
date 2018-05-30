require_relative 'card.rb'
require 'byebug'

class EmptyDeckError < RuntimeError; end

class Deck
  attr_reader :cards

  def initialize
    @cards = generate_cards
    @cards.shuffle!
  end

  def draw
    raise EmptyDeckError if @cards.empty?
    @cards.pop
  end

  private
  def generate_cards
    suits = [:spade,:diamond,:club,:heart].freeze
    card_arr = []
    suits.each do |suit|
      (2..14).each do |num|
        card_arr << Card.new(suit, num)
      end
    end

    card_arr
  end
end
