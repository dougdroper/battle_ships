class Fleet
  attr_reader :fleet
  def initialize
    @fleet = [Ship.new(5), Ship.new(4), Ship.new(3), Ship.new(3), Ship.new(2)]
  end

  def position
    @fleet
  end
end

class Ship
  attr_reader :length
  attr_accessor :x, :y, :direction
  def initialize(length)
    @length = length
  end
end