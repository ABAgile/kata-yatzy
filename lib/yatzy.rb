# class to calculate Yatzy score
class Yatzy
  def initialize(dices)
    @dices = dices.split('-').map(&:to_i)
  end

  def chance
    @dices.sum
  end

  def ones
    @dices.select {|x| x == 1}.sum
  end

  def twos
    @dices.select {|x| x == 2}.sum
  end

  def threes
    @dices.select {|x| x == 3}.sum
  end

  def fours
    @dices.select {|x| x == 4}.sum
  end

  def fives
    @dices.select {|x| x == 5}.sum
  end

  def sixes
    @dices.select {|x| x == 6}.sum
  end

  def yatzy
    @dices.uniq.count == 1 ? 50 : 0
  end

  def pair
    [6,5,4,3,2,1].each do |num|
      return num*2 if @dices.count(num) >= 2
    end
  end

  def two_pairs
    num_cal= []
    [1,2,3,4,5,6].each do |num|
      num_cal << num if @dices.count(num) >= 2
    end
    num_cal.size == 2 ? num_cal.sum*2 : 0
  end

  def three_of_a_kind
    num_cal = []
    [1,2,3,4,5,6].each do |num|
      num_cal << num if @dices.count(num) >= 3
    end
    num_cal.size == 1 ? num_cal.sum*3 : 0
  end

  def four_of_a_kind
    num_cal = []
    [1,2,3,4,5,6].each do |num|
      num_cal << num if @dices.count(num) >= 4
    end
    num_cal.size == 1 ? num_cal.sum*4 : 0
  end

  def small_straight
    @dices.sort! == [1,2,3,4,5] ? 15 : 0
  end

  def large_straight
    @dices.sort! == [2,3,4,5,6] ? 20 : 0
  end

  def full_house
    @dices.uniq.count == 2 ? @dices.sum : 0
  end

end
