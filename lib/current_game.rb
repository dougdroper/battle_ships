class CurrentGame
  attr_reader :id, :storage, :coordiantes
  def initialize(storage=RedisStorage.new, options={})
    @storage = storage
    @id = options["id"]
    @coordiantes = Coordinates.new(options)
  end

  def board
    storage.get(id).tap do |game|
      raise NoGameException unless game
    end
  end
end

class NoGameException < Exception
  def message
    "No Game Found"
  end
end