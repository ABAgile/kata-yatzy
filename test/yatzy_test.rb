# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/yatzy'

describe Yatzy do
  it 'should calculuate chance score' do
    assert_equal 15, Yatzy.new('1-2-3-4-5').chance
    assert_equal 14, Yatzy.new('1-1-3-3-6').chance
    assert_equal 21, Yatzy.new('1-4-5-5-6').chance
  end

  it 'should calculuate ones/twos/threes/fours/fives/Sixes score' do
    assert_equal 2, Yatzy.new('1-1-2-4-4').ones
    assert_equal 1, Yatzy.new('1-2-2-3-5').ones
    assert_equal 0, Yatzy.new('3-3-3-4-5').ones

    assert_equal 2, Yatzy.new('1-1-2-4-4').twos
    assert_equal 4, Yatzy.new('1-2-2-3-5').twos
    assert_equal 0, Yatzy.new('3-3-3-4-5').twos

    assert_equal 0, Yatzy.new('1-1-2-4-4').threes
    assert_equal 3, Yatzy.new('1-2-2-3-5').threes
    assert_equal 9, Yatzy.new('3-3-3-4-5').threes

    assert_equal 8, Yatzy.new('1-1-2-4-4').fours
    assert_equal 0, Yatzy.new('1-2-2-3-5').fours
    assert_equal 4, Yatzy.new('3-3-3-4-5').fours

    assert_equal 0, Yatzy.new('1-1-2-4-4').fives
    assert_equal 5, Yatzy.new('1-2-2-3-5').fives
    assert_equal 5, Yatzy.new('3-3-3-4-5').fives

    assert_equal 0, Yatzy.new('1-1-2-4-4').sixes
    assert_equal 0, Yatzy.new('1-2-2-3-5').sixes
    assert_equal 0, Yatzy.new('3-3-3-4-5').sixes
  end

  it 'should calculuate yatzy score' do
    assert_equal 50, Yatzy.new('1-1-1-1-1').yatzy
    assert_equal 0,  Yatzy.new('1-1-1-1-2').yatzy
  end

  it 'should calculuate pair score' do
    assert_equal 8,  Yatzy.new('3-3-3-4-4').pair
    assert_equal 12, Yatzy.new('1-1-2-6-6').pair
    assert_equal 6,  Yatzy.new('1-3-3-3-4').pair
    assert_equal 6,  Yatzy.new('1-3-3-3-3').pair
  end

  it 'should calculuate two_pairs score' do
    assert_equal 8, Yatzy.new('1-1-2-3-3').two_pairs
    assert_equal 0, Yatzy.new('1-1-2-3-4').two_pairs
    assert_equal 6, Yatzy.new('1-1-2-2-2').two_pairs
    assert_equal 8, Yatzy.new('1-2-2-2-2').two_pairs
  end

  it 'should calculuate three_of_a_kind score' do
    assert_equal 9, Yatzy.new('3-3-3-4-5').three_of_a_kind
    assert_equal 0, Yatzy.new('3-3-4-5-6').three_of_a_kind
    assert_equal 9, Yatzy.new('1-3-3-3-3').three_of_a_kind
  end

  it 'should calculuate four_of_a_kind score' do
    assert_equal 8, Yatzy.new('2-2-2-2-5').four_of_a_kind
    assert_equal 0, Yatzy.new('2-2-2-5-5').four_of_a_kind
    assert_equal 8, Yatzy.new('2-2-2-2-2').four_of_a_kind
  end

  it 'should calculuate small_straight score' do
    assert_equal 15, Yatzy.new('1-2-3-4-5').small_straight
    assert_equal 0,  Yatzy.new('2-2-2-5-5').small_straight
    assert_equal 0,  Yatzy.new('2-3-4-5-6').small_straight
  end

  it 'should calculuate large_straight score' do
    assert_equal 0,  Yatzy.new('1-2-3-4-5').large_straight
    assert_equal 0,  Yatzy.new('2-2-2-5-5').large_straight
    assert_equal 20, Yatzy.new('2-3-4-5-6').large_straight
  end

  it 'should calculuate full_house score' do
    assert_equal 8, Yatzy.new('1-1-2-2-2').full_house
    assert_equal 0, Yatzy.new('2-2-3-3-4').full_house
    assert_equal 0, Yatzy.new('4-4-4-4-4').full_house
  end
end
