# frozen_string_literal: true

# class for Yatzy dice rolling game score calculation
class Yatzy
  attr_reader :dices

  def initialize(dices)
    @dices = dices.split('-').map(&:to_i)
  end

  def chance(only: nil)
    return dices.sum if only.nil?

    dices.select { |dice| dice == only }.sum
  end

  %I[ones twos threes fours fives sixes].each.with_index do |face, idx|
    define_method(face) { chance(only: idx + 1) }
  end

  def yatzy
    dices.uniq.size == 1 ? 50 : 0
  end
end
