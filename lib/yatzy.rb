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

  %I[ones twos threes fours fives sixes].each.with_index do |face, idx|
    define_method(face) { sum_of(idx + 1) }
  end

  def yatzy
    dices.uniq.size == 1 ? 50 : 0
  end

  def pair
    2 * of_a_kind(2).max.to_i
  end

  def two_pairs
    return 0 if dices.uniq.size > 3

    [four_of_a_kind, two_of_a_kind].max
  end

  %I[
    two_of_a_kind
    three_of_a_kind
    four_of_a_kind
  ].each.with_index do |kind_of, idx|
    define_method(kind_of) { sum_of_a_kind(idx + 2) }
  end

  def small_straight
    dices == [1, 2, 3, 4, 5] ? chance : 0
  end

  def large_straight
    dices == [2, 3, 4, 5, 6] ? chance : 0
  end

  def full_house
    return 0 if dices.uniq.size != 2 || four_of_a_kind != 0

    chance
  end

  private

  def sum_of(face)
    dices.select { |dice| dice == face }.sum
  end

  def count_of(face)
    dices.count { |dice| dice == face }
  end

  def of_a_kind(num)
    dices.uniq.select { |face| count_of(face) >= num }
  end

  def sum_of_a_kind(num)
    of_a_kind(num).reduce(0) { |memo, face| memo + (num * face) }
  end
end
