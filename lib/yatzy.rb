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

  def self.ones(dice)
    return dice.count(1)
  end

  def self.twos(dice)
    return dice.count(2) * 2
  end

  def self.threes(dice)
    return dice.count(3) * 3
  end

  def self.fours(dice)
    return dice.count(4) * 4
  end

  def self.fives(dice)
    return dice.count(5) * 5
  end

  def self.sixes(dice)
    return dice.count(6) * 6
  end

  def self.pair(dice)
    (1..6).map do |num|
      if dice.count(num) >= 2
        num * 2
      else
        0
      end
    end.sum
  end

end
