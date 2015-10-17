class Game
  attr_accessor :human_player, :ai_player, :turn_owner
  def initialize
    @human_player = HumanPlayer.new
    @ai_player = AiPlayer.new
    TerminalInterface.intro

    setup_new_game(gets.chomp)
  end

  def start_new_game
    goes_first = randomize_who_goes_first
    if goes_first == "ai"
      self.turn_owner = @ai_player
    else
      self.turn_owner = @human_player
    end  

    turn_owner.make_move
  end

  private
  def randomize_who_goes_first
    ["player", "ai"].sample
  end

  def setup_new_game(board_size)
    @board = Board.new(board_size)
    human_player.start_new_game(@board)
    ai_player.start_new_game(@board)
    start_new_game
  end

end