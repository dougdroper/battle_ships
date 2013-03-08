class Game
  attr_reader :name, :email

  def new_game(options={})
    @name = options["name"]
    @email = options["email"]
    raise NameEmailException unless name && email
  end

  def fire(options={})
    GameLogic.new(self).update_status_of_opponent(options["status"])
    @opponent_coordiantes = Coordinates.new(options)
  end

  def opponent_coordiantes
    @opponent_coordiantes || []
  end

  def next_coordiantes
    GameLogic.new(self).xy
  end

  def fleet
    @fleet ||= Board.new.fleet
  end

  def status
    Board.new(fleet).fire(@opponent_coordiantes)
  end

  def id
    @id ||= object_id
  end
end

class NameEmailException < Exception
  def message
    "name and email are required"
  end
end