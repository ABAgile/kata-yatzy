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
    pattern = -> (count_type) do
      case count_type
      when 1 then [1, 2, 3, 4, 5]
      when 2 then [1, 1, 3, 4, 5]
      when 3 then [1, 1, 1, 4, 5]
      when 4 then [1, 1, 1, 1, 5]
      when 5 then [1, 1, 1, 1, 1]
      end
    end

    (1..5).each do |count_type|
      dice = pattern.call(count_type)
      assert_equal count_type * 1, Yatzy.count(dice, 1)
    end
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
