class AiPlayer
  attr_reader :board

  def start_new_game(board)
    @board = board
  end

  def make_move
    x_coordinate, y_coordinate = find_random_location
    @board.grid[x_coordinate][y_coordinate].owned_by = "ai"
  end

  private
  def find_random_location
    # binding.pry
    @board.available_spaces_remaining.sample
  end
end