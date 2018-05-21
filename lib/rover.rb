class Rover

  ORIENTATION_MAP = {
    N: [0,1],
    E: [1,0],
    S: [0,-1],
    W: [-1,0]
  }

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
    @position = [position, ORIENTATION_MAP[orientation]].transpose.map {|x| x.reduce(:+)}
  end

  def move_backwards
    @position = [position, ORIENTATION_MAP[orientation]].transpose.map {|x| x.reduce(:-)}
  end

end