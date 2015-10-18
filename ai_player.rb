class AiPlayer
  attr_reader :board
  attr_accessor :symbol

  def initialize(symbol)
    self.symbol = symbol
  end

  def start_new_game(board)
    @board = board
  end

  def make_move
    x_coordinate, y_coordinate = find_random_location
    @board.mark_taken(x_coordinate, y_coordinate, self)
    puts "ai just moved to [#{x_coordinate}, #{y_coordinate}]"
  end

  private
  def find_random_location
    @board.available_spaces_remaining.sample
  end
end