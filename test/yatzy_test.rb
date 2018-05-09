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

  it 'ones' do
    dice = [1, 1, 2, 2, 2]
    assert_equal 2, Yatzy.ones(dice)

    dice = [1, 1, 1, 1, 2]
    assert_equal 4, Yatzy.ones(dice)
  end

  it 'twos' do
    dice = [1, 1, 2, 2, 2]
    assert_equal 6, Yatzy.twos(dice)
  end

  it 'threes' do
    dice = [1, 1, 3, 3, 3]
    assert_equal 9, Yatzy.threes(dice)
  end

  it 'fours' do
    dice = [1, 1, 4, 4, 3]
    assert_equal 8, Yatzy.fours(dice)
  end

  it 'fives' do
    dice = [5, 5, 4, 4, 3]
    assert_equal 10, Yatzy.fives(dice)
  end
  it 'sixes' do
    dice = [6, 6, 4, 4, 3]
    assert_equal 12, Yatzy.sixes(dice)
  end
  it 'pair' do
    dice = [3, 3, 3, 4, 4]
    assert_equal 14, Yatzy.pair(dice)
  end
end
