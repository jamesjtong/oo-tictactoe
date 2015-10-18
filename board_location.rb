class BoardLocation
  attr_accessor :owned_by, :symbol, :grid, :x_coordinate, :y_coordinate, :board_width, :board_height

  def initialize(grid, x, y, board_width, board_height)
    self.grid = grid
    self.x_coordinate = x
    self.y_coordinate = y
    self.board_width = board_width
    self.board_height = board_height

    return self
  end

  def empty?
    owned_by.nil?
  end

  def top
    attempted_x_coordinate = x_coordinate-1
    attempted_y_coordinate = y_coordinate
    return VoidLocation.new if outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)

    grid[attempted_x_coordinate][attempted_y_coordinate]
  end

  def top_left
    attempted_x_coordinate = x_coordinate-1
    attempted_y_coordinate = y_coordinate-1
    return VoidLocation.new if outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)

    grid[attempted_x_coordinate][attempted_y_coordinate]
  end

  def top_right
    attempted_x_coordinate = x_coordinate-1
    attempted_y_coordinate = y_coordinate+1
    return VoidLocation.new if outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)

    grid[attempted_x_coordinate][attempted_y_coordinate]
  end

  def left
    attempted_x_coordinate = x_coordinate
    attempted_y_coordinate = y_coordinate-1
    return VoidLocation.new if outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)

    grid[attempted_x_coordinate][attempted_y_coordinate]
  end

  def right
    attempted_x_coordinate = x_coordinate
    attempted_y_coordinate = y_coordinate+1
    return VoidLocation.new if outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)

    grid[attempted_x_coordinate][attempted_y_coordinate]
  end

  def bottom
    attempted_x_coordinate = x_coordinate+1
    attempted_y_coordinate = y_coordinate
    return VoidLocation.new if outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)

    grid[x_coordinate+1][attempted_y_coordinate]
  end

  def bottom_left
    attempted_x_coordinate = x_coordinate+1
    attempted_y_coordinate = y_coordinate-1
    return VoidLocation.new if outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)

    grid[x_coordinate+1][attempted_y_coordinate]
  end

  def bottom_right
    attempted_x_coordinate = x_coordinate+1
    attempted_y_coordinate = y_coordinate+1
    return VoidLocation.new if outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)

    grid[x_coordinate+1][attempted_y_coordinate]
  end

  def outside_board_bounds?(attempted_x_coordinate, attempted_y_coordinate)
    return true if attempted_x_coordinate >= board_width
    return true if attempted_y_coordinate >= board_height
    return true if attempted_x_coordinate < 0
    return true if attempted_y_coordinate < 0
    false
  end

end