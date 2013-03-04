class Fleet
  attr_reader :fleet
  def initialize(fleet = [Ship.new(5), Ship.new(4), Ship.new(3), Ship.new(3), Ship.new(2)])
    @fleet = fleet
    @pos = []
  end

  def position_fleet
    @fleet.inject([]) do |pos,ship|
      position(ship, pos)
    end
  end

  def position(ship, pos)
    pos << place_ship(ship)
    check_valid(ship, pos)
  end

  def check_valid(ship, pos)
    if pos.flatten(1).uniq.length == pos.flatten(1).length
      pos
    else
      pos.pop
      position(ship,pos)
    end
  end

  def place_ship(ship)
    x, y, length, direction = ship.x, ship.y, ship.length, ship.direction
    dx, dy = direction == :across ? [1, 0] : [0, 1]
    (0 ... length).map{ |i| [x + i * dx, y + i * dy] }
  end
end

class Ship
  attr_reader :length, :x, :y, :direction
  def initialize(length)
    @length = length
  end

  def direction
    rand(2) == 1 ? :across : :down
  end

  def x
    rand(10 - length)
  end

  def y
    rand(10 - length)
  end
end