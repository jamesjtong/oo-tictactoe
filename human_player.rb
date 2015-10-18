class HumanPlayer < Player
  def make_move
    TerminalInterface.ask_player_to_make_move
    x,y = gets.chomp.split(",").map(&:to_i)
    board.mark_taken(y, x, self)
    puts "\n#{self} just marked [#{x}, #{y}]"
    board.output_board
  end

  def to_s
    "You, the human player,"
  end
end