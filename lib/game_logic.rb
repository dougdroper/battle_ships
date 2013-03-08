class GameLogic
  attr_reader :places_visited, :opponent_coordiantes, :status
  BOARD_LENGTH = 10
  MAX_BOARD_LENGTH = 100
  def initialize(game)
    @opponent_coordiantes = game.opponent_coordiantes.join("")
    @places_visited = game.fleet
  end

  def xy
    return if @places_visited.length == MAX_BOARD_LENGTH
    try = [random_number, random_number].join("")
    places_visited.keys.include?(try) ? xy : add_to_places_visited(try)
  end

  def update_status_of_opponent(status)
    places_visited[places_visited.keys.last] = status
  end

  private

  def add_to_places_visited(try)
    places_visited[try] = ""
    try.split('')
  end

  def random_number
    rand(BOARD_LENGTH)
  end
end