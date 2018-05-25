# frozen_string_literal: true

class Yatzy
  def self.chance(dice)
    dice.sum
  end

  def self.yatzy(dice)
    (dice.uniq.size == 1) ? 50 : 0
  end

  def self.count(dice, number)
    group(dice).fetch(number, 0) * number
  end

  def self.pair(dice)
    n_of_sum(dice, 2)
  end

  def self.three_of_a_kind(dice)
    n_of_sum(dice, 3)
  end

  def self.four_of_a_kind(dice)
    n_of_sum(dice, 4)
  end

  def self.small_straight(dice)
    ([1, 2, 3, 4, 5] == dice.sort) ?  15 : 0
  end

  def self.big_straight(dice)
    ([2, 3, 4, 5, 6] == dice.sort) ?  20 : 0
  end

  def self.full_house(dice)
    group(dice).values.sort == [2, 3] ? dice.sum : 0
  end

  private

  def self.group(dice)
    # {2 => 4, 1 => 1}
    Hash[dice.group_by{|k| k}.map{|k, v| [k, v.size]}]
  end

  def self.n_of_sum(dice, n)
    result = group(dice).select{ |k, v| v == n }.sort_by{ |k, v| k }.to_h
    (result.size == 0) ? 0 : result.sum{|k, _| k * n}
  end
end
