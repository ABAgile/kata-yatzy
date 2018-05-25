# frozen_string_literal: true

class Yatzy
  # attr_accessor :sum_score

  # def initialize(dice)
  #   dice = dice
  # end

  def self.score(dice)
    dice.sum
  end

  def self.yatzy(dice)
    return 50 if dice.uniq.size == 1
  end

  def self.count(dice, number)
    group(dice).fetch(number, 0) * number
  end

  def self.group(dice)
    # {2 => 4, 1 => 1}
    Hash[dice.group_by{|k| k}.map{|k, v| [k, v.size]}]
  end

  def self.pair(dice)
    (1..6).reverse_each do |num|
      return num * 2 if dice.count(num) >= 2
    end
    0
  end

  def self.two_pair(dice)
    return 0 unless group(dice).values.select{|v| v >= 2}.size == 2

    (1..6).map do |num|
      dice.count(num) >= 2 ? num * 2 : 0
    end.sum
  end

  def self.three_of_a_kind(dice)
    (group(dice).find{|k,v| v >= 3}&.first || 0) * 3
  end

  def self.four_of_a_kind(dice)
    (group(dice).find{|k,v| v >= 4}&.first || 0) * 4
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
end
