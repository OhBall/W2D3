require 'byebug'

class Array
  def my_uniq
    uniq = []

    self.each do |el|
      uniq << el unless uniq.include?(el)
    end

    uniq
  end

  def two_sum
    pairs = []

    (0 ... self.length - 1).each do |i|
      ((i + 1) ... self.length).each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end

    pairs
  end

  def my_transpose
    transposed = Array.new(self.length) { Array.new }

    self.each do |row|
      row.each_with_index do |col, col_index|
        transposed[col_index] << col
      end
    end

    transposed
  end
end

def stock_picker(stocks)
  profit_hash = {}
  stocks.each_with_index do |s1,s1_idx|
    stocks[(s1_idx+1)...stocks.length].each_with_index do |s2,s2_idx|
      profit_hash[s2-s1] = [s1_idx, (s2_idx + s1_idx + 1)]
    end
  end
  sorted = profit_hash.sort_by{ |k,v| k }
  sorted.last.last
end
