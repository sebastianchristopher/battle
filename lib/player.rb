class Player
  attr_reader :name, :hp
  def initialize(name, hp = 200)
    @name = name
    @hp = hp
  end

  def receive_damage
    @hp -= 10
  end
end
