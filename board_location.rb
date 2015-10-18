class BoardLocation
  attr_accessor :owned_by, :symbol, :grid, :x_coordinate, :y_coordinate

  def initialize(grid, x, y)
    self.grid = grid
    self.x_coordinate = x
    self.y_coordinate = y
    return self
  end

  def empty?
    owned_by.nil?
  end

  def top
    return VoidLocation.new if x_coordinate-1 < 0
    grid[x_coordinate-1][y_coordinate]
  end

  def top_left
    return VoidLocation.new if x_coordinate-1 < 0
    return VoidLocation.new if y_coordinate-1 < 0
    grid[x_coordinate-1][y_coordinate-1]
  end

  def top_right
    return VoidLocation.new if x_coordinate-1 < 0
    grid[x_coordinate-1][y_coordinate+1]
  end

  def left
    return VoidLocation.new if y_coordinate-1 < 0
    grid[x_coordinate][y_coordinate-1]
  end

  def right
    grid[x_coordinate][y_coordinate+1]
  end

  def bottom
    grid[x_coordinate+1][y_coordinate]
  end

  def bottom_left
    return VoidLocation.new if y_coordinate-1 < 0
    grid[x_coordinate+1][y_coordinate-1]
  end

  def bottom_right
    grid[x_coordinate+1][y_coordinate+1]
  end

end