class Grid

  attr_reader :height, :width, :obstacles

  def initialize(height = 10, width = 10, options = {})
    @height = height
    @width = width
    @obstacles = options[:obstacles] || []
  end
end