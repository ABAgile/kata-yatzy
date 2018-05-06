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
    2 * dices.uniq.sort.reverse.find { |face| count_of(face) > 1 }.to_i
  end

  def two_pairs
    return 0 if dices.uniq.size > 3

    [four_of_a_kind, of_a_kind(2)].max
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

  def sum_of(face)
    dices.select { |dice| dice == face }.sum
  end

  def count_of(face)
    dices.count { |dice| dice == face }
  end

  def of_a_kind(num)
    dices.uniq.reduce(0) do |memo, face|
      count = count_of(face)

      if count >= num
        num * face
      else
        0
      end + memo
    end
  end
end
