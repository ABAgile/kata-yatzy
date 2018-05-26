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
    case
    when yatzy? then 50
    when four_of_a_kind? then four_of_a_kind_score
    else
      0
    end
  end

  private

  def yatzy?
    group.values.any?(5)
  end

  def four_of_a_kind?
    group.values.any?(4)
    group.map{ |k, v| k if v == 4 }
  end

  def four_of_a_kind_score
    group.sum{ |k, v| (v == 4) ? k * v : 0 }
  end
end
