class NewGame
  attr_reader :name, :email, :storage
  def initialize(storage, options={})
    @storage = storage
    @name = options["name"]
    @email = options["email"]
    raise NameEmailException unless name && email
  end

  def game_name
    @game_name ||= "users:#{name.downcase}:#{id}"
  end

  private

  def id
    @id ||= storage.incr "users:#{name.downcase}"
  end
end

class NameEmailException < Exception
  def message
    "name and email are required"
  end
end