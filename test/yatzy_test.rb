# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/yatzy'

describe Yatzy do
  it 'chance' do
    dice = [1,2,3,4,6]
    assert_equal 16, Yatzy.chance(dice)
  end

  it 'yatzy' do
    [
      [[1, 2, 3, 4, 5], 0],
      [[1, 1, 3, 4, 5], 0],
      [[1, 1, 1, 4, 5], 0],
      [[1, 1, 1, 1, 5], 0],
      [[1, 1, 1, 1, 1], 50]
    ].each do |dice, expect_result|
      assert_equal expect_result, Yatzy.yatzy(dice)
    end
  end

  it 'count' do
    [
      [[1, 2, 3, 4, 5], 1],
      [[1, 1, 3, 4, 5], 2],
      [[1, 1, 1, 4, 5], 3],
      [[1, 1, 1, 1, 5], 4],
      [[1, 1, 1, 1, 1], 5]
    ].each do |dice, expect_result|
      assert_equal expect_result, Yatzy.count(dice, 1)
    end
  end

  it 'pair' do
    [
      [[1, 2, 3, 4, 5], 0], # no pair
      [[1, 1, 3, 4, 5], 2], # pair
      [[1, 1, 1, 4, 5], 0], # three of a kind
      [[1, 1, 1, 1, 5], 0], # foure of a kind
      [[1, 1, 1, 1, 1], 0], # Yahtzee
      [[1, 1, 3, 3, 5], 8], # two pair
      [[1, 1, 1, 3, 3], 6]  # one pair
    ].each do |dice, expect_result|
      assert_equal expect_result, Yatzy.pair(dice)
    end
  end

  it 'three of a kind' do
    [
      [[1, 2, 3, 4, 5], 0],
      [[1, 1, 3, 4, 5], 0],
      [[1, 1, 1, 4, 5], 3],
      [[1, 1, 1, 1, 5], 0],
      [[1, 1, 1, 1, 1], 0],
      [[1, 1, 3, 3, 5], 0],
      [[1, 1, 1, 3, 3], 3]
    ].each do |dice, expect_result|
      assert_equal expect_result, Yatzy.three_of_a_kind(dice)
    end
  end

  it 'four of a kind' do
    [
      [[1, 2, 3, 4, 5], 0],
      [[1, 1, 3, 4, 5], 0],
      [[1, 1, 1, 4, 5], 0],
      [[1, 1, 1, 1, 5], 4],
      [[1, 1, 1, 1, 1], 0],
      [[1, 1, 3, 3, 5], 0],
      [[1, 1, 1, 3, 3], 0]
    ].each do |dice, expect_result|
      assert_equal expect_result, Yatzy.four_of_a_kind(dice)
    end
  end

  it 'small straight' do
    [
      [[1, 2, 3, 4, 5], 15],
      [[5, 4, 3, 2, 1], 15],
      [[2, 3, 4, 5, 6], 0],
      [[1, 1, 3, 4, 5], 0],
      [[1, 1, 3, 3, 5], 0],
      [[1, 1, 1, 4, 5], 0],
      [[1, 1, 1, 1, 5], 0],
      [[1, 1, 1, 1, 1], 0]
    ].each do |dice, expect_result|
      assert_equal expect_result, Yatzy.small_straight(dice)
    end
  end


  it 'big straight' do
    [
      [[2, 3, 4, 5, 6], 20],
      [[6, 5, 4, 3, 2], 20],
      [[1, 2, 3, 4, 5], 0],
      [[1, 1, 3, 4, 5], 0],
      [[1, 1, 3, 3, 5], 0],
      [[1, 1, 1, 4, 5], 0],
      [[1, 1, 1, 1, 5], 0],
      [[1, 1, 1, 1, 1], 0]
    ].each do |dice, expect_result|
      assert_equal expect_result, Yatzy.big_straight(dice)
    end
  end


  it 'full_house' do
    [
      [[1, 2, 3, 4, 5], 0],
      [[1, 1, 3, 4, 5], 0],
      [[1, 1, 3, 3, 5], 0],
      [[1, 1, 1, 4, 5], 0],
      [[1, 1, 1, 1, 5], 0],
      [[1, 1, 1, 1, 1], 0],
      [[1, 1, 3, 3, 5], 0],
      [[1, 1, 1, 3, 3], 9]
    ].each do |dice, expect_result|
      assert_equal expect_result, Yatzy.full_house(dice)
    end
  end
end
