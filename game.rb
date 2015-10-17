require_relative "board"
require_relative "board_location"
require_relative "win_checker"
class Game
  def initialize
    intro
    start_new_game
  end

  def start_new_game
    Board.new
  end
end