class AiPlayer
  attr_reader :board
  attr_accessor :symbol

  def initialize(human_players_symbol)
    human_players_symbol == "X" ? self.symbol = "O" : self.symbol = "X"
  end

  def start_new_game(board)
    @board = board
  end

  def make_move
    x_coordinate, y_coordinate = find_random_location
    @board.mark_taken(x_coordinate, y_coordinate, self)
    puts "\nai just marked [#{x_coordinate}, #{y_coordinate}]"
    board.output_board
  end

  private
  def find_random_location
    @board.available_spaces_remaining.sample
  end
end