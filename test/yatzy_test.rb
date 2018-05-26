# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/yatzy'

describe Yatzy do
  let(:dice) { [1,1,1,1,1] }

  it 'earn points' do
    assert_equal Yatzy.new(dice).earn(1), 5
  end

  it 'Yatzy' do
    assert_equal Yatzy.new(dice).get_score, 50
  end
end
