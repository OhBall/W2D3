require_relative 'deck.rb'

class FullHandError < RuntimeError; end
class Hand
  attr_reader :cards

  WINNING_HANDS = [
    :straight_flush,
    :four_kind,
    :full_house,
    :flush,
    :straight,
    :three_kind,
    :two_pair,
    :high_card
  ]


  def initialize
    @cards = []
  end

  def add_card(card)
    raise FullHandError if full?
    self.cards << card
  end

  def full?
    self.cards.length >= 5
  end

  def value

  end

  def flush?
    suits = cards.map {|card| card.suit }
    suits.all? {|suit| suits[0]}
  end

  def straight?
    values = cards.map {|card| card.value}
    values.sort!
    prev_card
  end
end
