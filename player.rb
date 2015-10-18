class Player
  attr_reader :board
  attr_accessor :symbol

  def initialize(symbol)
    self.symbol = symbol
  end

  def start_new_game(board)
    @board = board
  end
end