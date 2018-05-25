# class to calculate Yatzy score
class Yatzy
  def initialize(dices)
    @dices = dices.split('-').map(&:to_i)
    @dice_range = [1, 2, 3 ,4 ,5, 6]
  end

  def each_num_score(num)
    @dices.select{|x| x == num}.sum
  end

  def point_out_kind_of_score(dice_num)
    # pair(2) : [1,1,2,2,4] => [1,2]
    num_cal= []
    @dice_range.each do |num|
      num_cal << num if @dices.count(num) >= dice_num
    end
    num_cal
  end

  def chance
    @dices.sum
  end

  def ones
    each_num_score(1)
  end

  def twos
    each_num_score(2)
  end

  def threes
    each_num_score(3)
  end

  def fours
    each_num_score(4)
  end

  def fives
    each_num_score(5)
  end

  def sixes
    each_num_score(6)
  end

  def yatzy
    @dices.uniq.count == 1 ? 50 : 0
  end

  def pair
    @dice_range.reverse_each do |num|
      return num*2 if @dices.count(num) >= 2
    end
  end

  def two_pairs
    point_out_kind_of_score(2).size == 2? point_out_kind_of_score(2).sum*2 : 0
  end

  def three_of_a_kind
    point_out_kind_of_score(3).size == 1? point_out_kind_of_score(3).sum*3 : 0
  end

  def four_of_a_kind
    point_out_kind_of_score(4).size == 1? point_out_kind_of_score(4).sum*4 : 0
  end

  def small_straight
    @dices.sort! == [1,2,3,4,5] ? 15 : 0
  end

  def large_straight
    @dices.sort! == [2,3,4,5,6] ? 20 : 0
  end

  def full_house
    num_cal = []
    @dice_range.each do |num|
      num_cal << num if @dices.count(num) >= 2 && @dices.uniq.count == 2
    end
    num_cal.size == 2 ? @dices.sum : 0
  end
end
