# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/yatzy'

describe Yatzy do
  # let(:subject) { Yatzy }
  # let(:default_dice) { [1,2,3,4,6] }

  it 'should calculate correct chance' do
    # dice = default_dice
    dice = [1,2,3,4,6]

    # sum = subject.new(dice).score

    assert_equal 16, Yatzy.score(dice)
  end

  it 'yatzy' do
    dice = [1, 1, 1, 1, 1]

    assert_equal 50, Yatzy.yatzy(dice)
  end

  it 'count' do
    dice = [1, 1, 2, 2, 2]
    assert_equal 2, Yatzy.count(dice, 1)

    dice = [1, 1, 1, 1, 2]
    assert_equal 4, Yatzy.count(dice, 1)

    dice = [1, 1, 2, 2, 2]
    assert_equal 6, Yatzy.count(dice, 2)

    dice = [1, 1, 3, 3, 3]
    assert_equal 9, Yatzy.count(dice, 3)

    dice = [1, 1, 4, 4, 3]
    assert_equal 8, Yatzy.count(dice, 4)

    dice = [5, 5, 4, 4, 3]
    assert_equal 10, Yatzy.count(dice, 5)

    dice = [6, 6, 4, 4, 3]
    assert_equal 12, Yatzy.count(dice, 6)
  end

  it 'pair' do
    dice = [3, 3, 3, 4, 4]
    assert_equal 8, Yatzy.pair(dice)
  end

  it 'two pairs' do
    dice = [3, 3, 4, 4, 5]

    assert_equal 14, Yatzy.two_pair(dice)
  end

  it 'two pairs' do
    dice = [1, 1, 2, 3, 4]

    assert_equal 0, Yatzy.two_pair(dice)
  end

  it 'three of a kind' do
    dice = [1, 1, 1, 3, 4]
    assert_equal 3, Yatzy.three_of_a_kind(dice)

    dice2 = [5, 1, 1, 3, 4]
    assert_equal 0, Yatzy.three_of_a_kind(dice2)
  end

  it 'four of a kind' do
    dice = [1, 1, 1, 1, 4]
    assert_equal 4, Yatzy.four_of_a_kind(dice)

    dice2 = [5, 1, 1, 3, 4]
    assert_equal 0, Yatzy.four_of_a_kind(dice2)
  end

  it 'small straight' do
    dice = [1, 2, 3, 4, 5]
    assert_equal 15, Yatzy.small_straight(dice)

    dice = [1, 5, 3, 4, 5]
    assert_equal 0, Yatzy.small_straight(dice)
  end


  it 'big straight' do
    dice = [2, 3, 4, 5, 6]
    assert_equal 20, Yatzy.big_straight(dice)

    dice = [1, 5, 3, 4, 5]
    assert_equal 0, Yatzy.big_straight(dice)
  end


  it 'full_house' do
    dice = [3, 3, 3, 2, 2]
    assert_equal 13, Yatzy.full_house(dice)

    dice = [1, 5, 3, 4, 5]
    assert_equal 0, Yatzy.full_house(dice)
  end
end
