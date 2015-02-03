class Player
  attr_reader :name, :shape

  def initialize(name, shape)
    @name = name
    @shape = shape
  end

  def to_s
    @name
  end
end
