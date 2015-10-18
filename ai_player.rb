class AiPlayer < Player
  def make_move
    x_coordinate, y_coordinate = @board.find_random_available_location
    @board.mark_taken(x_coordinate, y_coordinate, self)
    puts "\n#{self} just marked [#{y_coordinate}, #{x_coordinate}]"
    board.output_board
  end

  private
  def to_s
    "The AI Player"
  end
end