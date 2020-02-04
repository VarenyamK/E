# Authors: Connor Babcock

# define class Player
class Player
  attr_accessor(:id, :name, :set, :total_sets)
  attr_reader(:id, :set, :total_sets)
  attr_writer(:set, :total_sets)

  def initialize(id, name)
    # defines attributes of a player
    @id = id
    @name = name
    @set = 0
    @total_sets = 0
  end
end


