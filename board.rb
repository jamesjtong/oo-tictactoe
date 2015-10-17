class Board
  attr_reader :width, :height
  attr_accessor :grid

  def initialize(grid_size_string="3x3")
    @width, @height = parse_grid_width_height(grid_size_string)
    @grid = []
    set_up_board
  end

  private
  def parse_grid_width_height(grid_size_string)
    grid_size_string[/^\d*/]
    grid_size_string[/\d*$/]
    [width, height]
  end

  def set_up_board
    width.times do |i|
      grid << [BoardLocation.new]
      height.times do |n|
        grid[n] << [BoardLocation.new]
      end
    end
  end
end