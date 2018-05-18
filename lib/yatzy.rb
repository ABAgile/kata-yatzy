# frozen_string_literal: true

# class for Yatzy dice rolling game score calculation
class Yatzy
  attr_reader :dices

  def initialize(dices)
    @dices = dices.split('-').map(&:to_i)
  end

  def chance
    dices.sum
  end

  %I[ones twos threes fours fives sixes].each.with_index(1) do |face, idx|
    define_method(face) { dices.count(idx) * idx }
  end

  def yatzy
    dices.uniq.size == 1 ? 50 : 0
  end

  def pair
    2 * of_a_kind(2).max.to_i
  end

  def two_pairs
    of_a_kind(2).size != 2 ? 0 : sum_of_a_kind(2)
  end

  %I[
    three_of_a_kind
    four_of_a_kind
  ].each.with_index(3) do |name, idx|
    define_method(name) { sum_of_a_kind(idx) }
  end

  def small_straight
    dices == [1, 2, 3, 4, 5] ? 15 : 0
  end

  def large_straight
    dices == [2, 3, 4, 5, 6] ? 20 : 0
  end

  def full_house
    of_a_kind(3).size == 1 && of_a_kind(2).size == 2 ? chance : 0
  end

  private

  def of_a_kind(num)
    dices.uniq.select { |face| dices.count(face) >= num }
  end

  def sum_of_a_kind(num)
    of_a_kind(num).map { |face| num * face }.sum
  end
end
