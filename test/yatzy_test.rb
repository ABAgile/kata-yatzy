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
end
