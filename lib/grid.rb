class Grid

  attr_reader :x, :y, :obstacles

  def initialize(x = 10, y = 10, options = {})
    @x = x
    @y = y
    @obstacles = options[:obstacles] || []
  end
end