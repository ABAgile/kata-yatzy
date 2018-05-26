# frozen_string_literal: true

class Yatzy
  attr_accessor :dice, :group

  def initialize(dice)
    @dice  = dice
    @group = dice_group(dice)
  end

  def earn(num)
    dice.sum{ |d| d if d == num }.to_i
  end

  def dice_size(num)
    dice.count{ |d| d if d == num }.to_i
  end

  def dice_group(dice)
    (1..6).each_with_object({}) do |num, hash|
      hash[num] = dice_size(num)
    end
  end

  def get_score
    score = case
            when yatzy?
              50
            end
    score
  end

  private

  def yatzy?
    group.values.any?(5)
  end
end
