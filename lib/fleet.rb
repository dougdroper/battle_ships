class Fleet
  attr_reader :fleet
  def initialize
    @fleet = [Ship.new(5), Ship.new(4), Ship.new(3), Ship.new(3), Ship.new(2)]
    @available_positions = [(0...10), (0...10)]
  end

  def position
    @fleet.map {|s| s.position(@available_positions) }
  end

  def place_ship(ship)
    x, y, length, direction = ship
    dx, dy = direction == :across ? [1, 0] : [0, 1]
    (0 ... length).map{ |i| [x + i * dx, y + i * dy] }
  end
end

class Ship
  attr_reader :length
  attr_accessor :x, :y, :direction
  def initialize(length)
    @length = length
  end

  def direction
    :across
  end

  def position(available_positions)
    x,y = random_position(available_positions)
  end

  private

  def random_position(available_positions)
    if direction == :across
      x_pos = available_positions.first.to_a
      range = x_pos.slice(start(x_pos), length)
      available_positions = available_positions - range
      [range.first, 0]
    end
  end

  def start(available_positions)
    (available_positions.length - length)
  end
end