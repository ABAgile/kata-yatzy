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
    dices.uniq.sort.reverse.tap do |sorted_faces|
      return 0 if sorted_faces.size >= 5

      sorted_faces.each do |face|
        return 2 * face if dices.count { |dice| dice == face } >= 2
      end
    end
  end

  def two_pairs
    faces = dices.uniq
    return 0 if faces.size > 3

    faces.reduce(0) do |memo, face|
      count = dices.count { |dice| dice == face }
      if count >= 4
        4 * face
      elsif count >= 2
        2 * face
      else
        0
      end + memo
    end
  end

  def three_of_a_kind
    faces = dices.uniq
    return 0 if faces.size > 3

    faces.each do |face|
      return 3 * face if dices.count { |dice| dice == face } >= 3
    end
  end
end
