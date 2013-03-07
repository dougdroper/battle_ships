class GameLogic
  attr_reader :places_visited
  BOARD_LENGTH = 10
  MAX_BOARD_LENGTH = 100
  def initialize(opponent_coordiantes, places_visited={})
    @opponent_coordiantes = opponent_coordiantes.join("")
    @places_visited = places_visited
    status_of_opponent
  end

  def xy
    return if @places_visited.length == MAX_BOARD_LENGTH
    try = [random_number, random_number].join("")
    places_visited.include?(try) ? xy : add_to_places_visited(try)
  end

  private

  def status_of_opponent

  end

  def add_to_places_visited(try)
    places_visited[try] = ""
    try.split('')
  end

  def random_number
    rand(BOARD_LENGTH)
  end
end