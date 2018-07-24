require_relative './powerset'

module Knapsack
  class Item
    attr_reader :name, :value, :weight
    def initialize(name, value, weight)
      @name = name
      @value = value
      @weight = weight
    end

    def weight_inverse
      1.0/@weight
    end

    def density
      @value.to_f/@weight
    end

    def to_s
      '<' + @name + ', ' + @value.to_s + ', ' + @weight.to_s + '>'
    end
  end

  def self.greedy
  end

  def self.build_items
  end

  def self.test_greedy
  end

  def self.test_greedys
  end

  def self.choose_best
  end

  def self.test_best
  end
end
