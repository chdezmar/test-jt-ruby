class RoverController

  attr_reader :commands, :grid, :rover

  def initialize(rover = Rover.new, grid = Grid.new)
    @rover = rover
    @grid = grid
  end

  def move(commands)
    @commands = commands
    @commands.each do |command|
      case command
      when :R then rover.turn_right
      when :L then rover.turn_left
      when :F then rover.move_forward 
      when :B then rover.move_backwards
      end
      recalculate_coordinates_for_sphere
    end
  end

  private

  def recalculate_coordinates_for_sphere
    rover.position[0] %= grid.width if rover.position[0] > grid.width
    rover.position[1] %= grid.height if rover.position[1] > grid.height
  end
end