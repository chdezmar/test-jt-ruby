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

  def move_forward
    position[1] += 1 if orientation == :N
    position[0] += 1 if orientation == :E
    position[1] -= 1 if orientation == :S
    position[0] -= 1 if orientation == :W
  end

  def move_backwards
    position[1] -= 1 if orientation == :N
    position[0] -= 1 if orientation == :E
    position[1] += 1 if orientation == :S
    position[0] += 1 if orientation == :W
  end

end