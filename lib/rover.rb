class Rover

  ORIENTATIONS = [:N, :E, :S, :W]

  ORIENTATION_MAP = {
    N: [0,1],
    E: [1,0],
    S: [0,-1],
    W: [-1,0]
  }

  attr_reader :position, :orientation

  def initialize
    @position = [0,0]
    @orientation = :N
  end

  def deploy(position, orientation)
    @position = position
    @orientation = orientation
  end

  def move_forward
    @position = forward_position
  end

  def move_backwards
    @position = backwards_position
  end

  def forward_position
    position_with_orientation.map {|x| x.reduce(:+)}
  end

  def backwards_position
    position_with_orientation.map {|x| x.reduce(:-)}
  end

  def turn_right
    @orientation = spin(:right)
  end

  def turn_left
    @orientation = spin(:left)
  end

  private

  def spin(direction)
    index_change = direction == :right ? 1 : -1
    ORIENTATIONS[(ORIENTATIONS.index(orientation) + index_change) % ORIENTATIONS.size]
  end

  def position_with_orientation
    [position, ORIENTATION_MAP[orientation]].transpose
  end

end