class RoverController

  attr_reader :commands, :grid, :rover

  def initialize(rover = Rover.new, grid = Grid.new)
    @rover = rover
    @grid = grid
  end

  def move(commands)
    commands.each do |command|
      case command
      when :R then rover.turn_right
      when :L then rover.turn_left
      when :F then move_forward
      when :B then move_backwards
      end
    end
  end

  private

  def move_forward
    next_position = rover.forward_position
    if grid.obstacles.include?(next_position)
      raise "Obstacle detected, movement aborted!! Rover position is #{rover.position}"
    else
      rover.move_forward
    end
    recalculate_coordinates_for_sphere
  end

  def move_backwards
    next_position = rover.backwards_position
    if grid.obstacles.include?(next_position)
      raise "Obstacle detected, movement aborted!! Rover position is #{rover.position}"
    else
      rover.move_backwards
    end
    recalculate_coordinates_for_sphere
  end

  def recalculate_coordinates_for_sphere
    # Our special sphere overlaps x and y edges on their max values
    # ie. [10,10] becomes [0,0]
    if rover.position[0] >= grid.width || rover.position[0] < 0
      rover.position[0] = (rover.position[0] % grid.width).abs
    end
    if rover.position[1] >= grid.height || rover.position[1] < 0
      rover.position[1] = (rover.position[1] % grid.height).abs
    end
  end
end