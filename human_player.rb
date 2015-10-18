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
    board.mark_taken(x, y, self)
    puts "\nyou just marked [#{x}, #{y}]"
    board.output_board
  end
end