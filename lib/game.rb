require 'redis_storage'

class Game
  attr_reader :name, :email, :storage, :board

  def initialize(storage=RedisStorage.new, board=Board.new)
    @storage, @board = storage, board
  end

  def id
    @id ||= storage.incr "users:#{name.downcase}"
  end

  def new_game(options={})
    @name, @email = options["name"], options["email"]
    return [500, {:error => "name/email is required"}] unless name && email
    storage.set(game_name, Board.new.board)
    [200, {:id => game_name, :x => 1, :y => 1}]
  end

  def fire(options={})
    current_board = storage.get(options["id"])
    return [500, {:error => "no game in progress"}] unless current_board
    game = Board.new(current_board)
    [200, {:id=>"users:doug:1", :x=>1, :y=>1, :status=>game.status}]
  end

  def next_move
    {"id" => id, "x" => 1, "y" => 2}
  end

  private

  def game_name
    @game_name ||= "users:#{name.downcase}:#{id}"
  end

end