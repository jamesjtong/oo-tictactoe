class HumanPlayer
  attr_reader :board

  def start_new_game(board)
    @board = board
  end

  def make_move
    puts TerminalInterface.ask_player_to_make_move
    x,y = gets.chomp.split(",").map(&:to_i)
    board.mark_taken(x, y, "human")
  end
end