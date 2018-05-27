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
      when :F, :B then move_rover(command)
      end
    end
  end

  private

  def move_rover(direction)
    direction = direction == :F ? 'forward' : 'backwards'
    if grid.obstacles.include?(rover.send("#{direction}_position"))
      raise StandardError, "ATTENTION: Obstacle detected, move cancelled. Rover position is #{rover.position}"
    else
      rover.send("move_#{direction}")
    end
    recalculate_coordinates_for_sphere
  end

  # Our special sphere overlaps x and y edges on their max values
  # ie. [10,10] becomes [0,0]
  def recalculate_coordinates_for_sphere
    if rover.position[0] >= grid.width || rover.position[0] < 0
      rover.position[0] = (rover.position[0] % grid.width).abs
    end
    if rover.position[1] >= grid.height || rover.position[1] < 0
      rover.position[1] = (rover.position[1] % grid.height).abs
    end
  end
end