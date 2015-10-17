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
    @board.check_for_winner
    next_turn
  end

  private
  def randomize_who_goes_first
    [ai_player, human_player].sample
  end

  def setup_new_game(board_size)
    @board = Board.new(board_size)
    @board.set_up_board
    human_player.start_new_game(@board)
    ai_player.start_new_game(@board)
    start_new_game
  end

  def next_turn
    switch_turns
    turn_owner.make_move
    next_turn unless game_over?
  end

  def game_over?
    false
  end

  def switch_turns
    turn_owner == ai_player ? self.turn_owner = human_player : self.turn_owner = ai_player
  end

end