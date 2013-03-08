class CurrentGame
  attr_reader :id, :storage, :coordiantes, :fleet, :status
  def initialize(storage=RedisStorage.new, options={})
    @storage = storage
    @id = options["id"]
    @status = options["status"]
    @coordiantes = Coordinates.new(options)
  end

  def fleet
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