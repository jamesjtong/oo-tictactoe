class BoardLocation
  attr_accessor :owned_by, :symbol, :grid, :x_coordinate, :y_coordinate, :board_width, :board_height

  def initialize(grid, x, y, board_width, board_height)
    self.grid = grid
    self.x_coordinate = x
    self.y_coordinate = y
    self.board_width = board_width
    self.board_height = board_height
    self
  end

  def empty?
    owned_by.nil?
  end

  def top
    find_direction_grid_location(-1,0)
  end

  def top_left
    find_direction_grid_location(-1,-1)
  end

  def top_right
    find_direction_grid_location(-1,+1)
  end

  def left
    find_direction_grid_location(0,-1)
  end

  def right
    find_direction_grid_location(0,1)
  end

  def bottom
    find_direction_grid_location(1,0)
  end

  def bottom_left
    find_direction_grid_location(1,-1)
  end

  def bottom_right
    find_direction_grid_location(1,1)
  end

  private
  def find_direction_grid_location(x_coordinate_plus_minus, y_coordinate_plus_minus)
    attempted_x_coordinate = x_coordinate+x_coordinate_plus_minus
    attempted_y_coordinate = y_coordinate+y_coordinate_plus_minus
    return VoidLocation.new if outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)

    grid[attempted_x_coordinate][attempted_y_coordinate]

  end

  def outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)
    return true if attempted_x_coordinate >= board_width
    return true if attempted_y_coordinate >= board_height
    return true if attempted_x_coordinate < 0
    return true if attempted_y_coordinate < 0
    false
  end

end