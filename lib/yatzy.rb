# frozen_string_literal: true

class Yatzy
  attr_accessor :dice

  def initialize(dice)
    @dice = dice
  end

  def earn(num)
    dice.sum{ |d| d if d == num }
  end
end
