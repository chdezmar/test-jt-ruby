class Rover

  attr_reader :position, :orientation

  def initialize
    @position = []
    @orientation = nil
  end

  def deploy(position, orientation)
    @position = position
    @orientation = orientation
  end
  
end