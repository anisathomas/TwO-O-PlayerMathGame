class Player

  attr_accessor :name, :current_lives

  def initialize(name)
    @name = name
    @current_lives = 3
  end

  def dead?
    @current_lives <= 0
  end

  def decrease_score
    @current_lives = @current_lives -1
  end

end