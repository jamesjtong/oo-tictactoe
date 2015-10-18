class HumanPlayer
  attr_reader :board
  attr_accessor :symbol
  def initialize(symbol)
    self.symbol = symbol
  end

  def start_new_game(board)
    @board = board
  end

  def make_move
    TerminalInterface.ask_player_to_make_move
    x,y = gets.chomp.split(",").map(&:to_i)
    #switch direction, to make user interface more natural
    board.mark_taken(y, x, self)
    puts "\n#{self} just marked [#{x}, #{y}]"
    board.output_board
  end

  def to_s
    "You, the human player,"
  end
end