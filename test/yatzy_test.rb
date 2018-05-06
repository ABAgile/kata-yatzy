# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/yatzy'

describe 'chance score' do
  subject { ->(dices) { Yatzy.new(dices).chance } }

  it 'should calculuate chance score' do
    assert_equal 15, subject.call('1-2-3-4-5')
    assert_equal 14, subject.call('1-1-3-3-6')
    assert_equal 21, subject.call('1-4-5-5-6')
  end
end

describe 'ones score' do
  subject { ->(dices) { Yatzy.new(dices).ones } }

  it 'should calculuate ones score' do
    assert_equal 2, subject.call('1-1-2-4-4')
    assert_equal 1, subject.call('1-2-2-3-5')
    assert_equal 0, subject.call('3-3-3-4-5')
  end
end

describe 'twos score' do
  subject { ->(dices) { Yatzy.new(dices).twos } }

  it 'should calculuate twos score' do
    assert_equal 2, subject.call('1-1-2-4-4')
    assert_equal 4, subject.call('1-2-2-3-5')
    assert_equal 0, subject.call('3-3-3-4-5')
  end
end

describe 'threes score' do
  subject { ->(dices) { Yatzy.new(dices).threes } }

  it 'should calculuate threes score' do
    assert_equal 0, subject.call('1-1-2-4-4')
    assert_equal 3, subject.call('1-2-2-3-5')
    assert_equal 9, subject.call('3-3-3-4-5')
  end
end

describe 'fours score' do
  subject { ->(dices) { Yatzy.new(dices).fours } }

  it 'should calculuate fours score' do
    assert_equal 8, subject.call('1-1-2-4-4')
    assert_equal 0, subject.call('1-2-2-3-5')
    assert_equal 4, subject.call('3-3-3-4-5')
  end
end

describe 'fives score' do
  subject { ->(dices) { Yatzy.new(dices).fives } }

  it 'should calculuate fives score' do
    assert_equal 0, subject.call('1-1-2-4-4')
    assert_equal 5, subject.call('1-2-2-3-5')
    assert_equal 5, subject.call('3-3-3-4-5')
  end
end

describe 'sixes score' do
  subject { ->(dices) { Yatzy.new(dices).sixes } }

  it 'should calculuate sixes score' do
    assert_equal 0, subject.call('1-1-2-4-4')
    assert_equal 0, subject.call('1-2-2-3-5')
    assert_equal 0, subject.call('3-3-3-4-5')
  end
end

describe 'yatzy score' do
  subject { ->(dices) { Yatzy.new(dices).yatzy } }

  it 'should calculuate yatzy score' do
    assert_equal 50, subject.call('1-1-1-1-1')
    assert_equal 0,  subject.call('1-1-1-1-2')
  end
end

describe 'pair score' do
  subject { ->(dices) { Yatzy.new(dices).pair } }

  it 'should calculuate pair score' do
    assert_equal 8,  subject.call('3-3-3-4-4')
    assert_equal 12, subject.call('1-1-2-6-6')
    assert_equal 6,  subject.call('1-3-3-3-4')
    assert_equal 6,  subject.call('1-3-3-3-3')
  end
end

describe 'two_pairs score' do
  subject { ->(dices) { Yatzy.new(dices).two_pairs } }

  it 'should calculuate two_pairs score' do
    assert_equal 8, subject.call('1-1-2-3-3')
    assert_equal 0, subject.call('1-1-2-3-4')
    assert_equal 6, subject.call('1-1-2-2-2')
    assert_equal 8, subject.call('1-2-2-2-2')
  end
end

describe 'three_of_a_kind score' do
  subject { ->(dices) { Yatzy.new(dices).three_of_a_kind } }

  it 'should calculuate three_of_a_kind score' do
    assert_equal 9, subject.call('3-3-3-4-5')
    assert_equal 0, subject.call('3-3-4-5-6')
    assert_equal 9, subject.call('1-3-3-3-3')
  end
end

describe 'four_of_a_kind score' do
  subject { ->(dices) { Yatzy.new(dices).four_of_a_kind } }

  it 'should calculuate four_of_a_kind score' do
    assert_equal 8, subject.call('2-2-2-2-5')
    assert_equal 0, subject.call('2-2-2-5-5')
    assert_equal 8, subject.call('2-2-2-2-2')
  end
end

describe 'small_straight score' do
  subject { ->(dices) { Yatzy.new(dices).small_straight } }

  it 'should calculuate small_straight score' do
    assert_equal 15, subject.call('1-2-3-4-5')
    assert_equal 0,  subject.call('2-2-2-5-5')
    assert_equal 0,  subject.call('2-3-4-5-6')
  end
end

describe 'large_straight score' do
  subject { ->(dices) { Yatzy.new(dices).large_straight } }

  it 'should calculuate large_straight score' do
    assert_equal 0,  subject.call('1-2-3-4-5')
    assert_equal 0,  subject.call('2-2-2-5-5')
    assert_equal 20, subject.call('2-3-4-5-6')
  end
end

describe 'full_house score' do
  subject { ->(dices) { Yatzy.new(dices).full_house } }

  it 'should calculuate full_house score' do
    assert_equal 8, subject.call('1-1-2-2-2')
    assert_equal 0, subject.call('2-2-3-3-4')
    assert_equal 0, subject.call('4-4-4-4-4')
  end
end
