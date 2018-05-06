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

  def ones
    dices.select { |dice| dice == 1 }.sum
  end

  def twos
    dices.select { |dice| dice == 2 }.sum
  end

  def threes
    dices.select { |dice| dice == 3 }.sum
  end

  def fours
    dices.select { |dice| dice == 4 }.sum
  end

  def fives
    dices.select { |dice| dice == 5 }.sum
  end

  def sixes
    dices.select { |dice| dice == 6 }.sum
  end
end
