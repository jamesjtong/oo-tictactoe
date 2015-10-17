class GridParser
  def parse_grid_width_height(grid_size_string)
    [grid_size_string[/^\d*/].to_i, grid_size_string[/\d*$/].to_i]
  end
end