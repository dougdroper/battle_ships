class CurrentGame
  attr_reader :game
  def initialize(options={})
    @id = options["id"]
    @status = options["status"]
    begin
      @game = Marshal.load(RedisStorage.new.get(options["id"]))
    rescue
      raise NoGameException.new
    end
  end
end

class NoGameException < Exception
  def message
    "No Game Found"
  end
end