class Player

  MAX_HIT_POINTS = 100

  attr_reader :hit_points, :name

  def initialize(name = nil)
    @name = name
    @hit_points = MAX_HIT_POINTS
  end

  def attack(opponent)
    opponent.get_hit
  end

  def get_hit
    @hit_points -= 10
  end

end