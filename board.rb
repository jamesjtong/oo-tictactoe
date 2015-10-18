class Board
  attr_reader :width, :height
  attr_accessor :grid

  def initialize(grid_size_string="3x3")
    @width, @height = GridParser.new.parse_grid_width_height(grid_size_string)
    self.grid = []
  end

  def set_up_board
    width.times do |i|
      grid << []
      height.times do |h|
        grid[i] << BoardLocation.new
      end
    end
  end

  def mark_taken(x_coordinate, y_coordinate, player)
    grid[x_coordinate][y_coordinate].owned_by = player
    grid[x_coordinate][y_coordinate].symbol = player.symbol
  end

  def available_spaces_remaining
    available_spaces_remaining_array = []
    grid.each_with_index do |row, i|
      column_select_index = -1
      row.each do |board_location|
        column_select_index += 1
        available_spaces_remaining_array << [i, column_select_index] if board_location.empty?
      end
    end

    available_spaces_remaining_array
  end

  def check_for_winner
  end

  def output_board
    grid.each_with_index do |row_layer, row_index|
      puts "\n"
      row_layer.each_with_index do |board_location, column_index|
        print symbol_to_print(board_location)
      end
    end
  end

  private
  def symbol_to_print(board_location)
    board_location.symbol.nil? ? "| |" : "|#{board_location.symbol}|"
  end

end