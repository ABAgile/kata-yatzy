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

  def pair
    first_pair = dices.uniq.sort.reverse.find { |face| count_of(face) > 1 }

    first_pair.nil? ? 0 : 2 * first_pair
  end

  def two_pairs
    dices.uniq.size > 3 ? 0 : of_a_kind(2)
  end

  def three_of_a_kind
    of_a_kind(3)
  end

  def four_of_a_kind
    of_a_kind(4)
  end

  def small_straight
    dices == [1, 2, 3, 4, 5] ? chance : 0
  end

  def large_straight
    dices == [2, 3, 4, 5, 6] ? chance : 0
  end

  private

  def count_of(face)
    dices.count { |dice| dice == face }
  end

  def of_a_kind(num)
    dices.uniq.reduce(0) do |memo, face|
      count = count_of(face)

      if count >= 2 * num
        2 * num * face
      elsif count >= num
        num * face
      else
        0
      end + memo
    end
  end
end
