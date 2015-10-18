class Game
  attr_accessor :human_player, :ai_player, :turn_owner
  def initialize
    TerminalInterface.intro

    size_of_board = gets.chomp 

    selected_symbol = ask_for_symbol

    @human_player = HumanPlayer.new(selected_symbol)
    
    @human_player.symbol == "X" ? selected_symbol = "O" : selected_symbol = "X"
    @ai_player = AiPlayer.new(selected_symbol)

    setup_new_game(size_of_board)
  end

  def start_new_game
    goes_first = randomize_who_goes_first
    if goes_first == "ai"
      self.turn_owner = @ai_player
    else
      self.turn_owner = @human_player
    end  

    @board.output_board
    turn_owner.make_move
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
    check_for_winner
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

  def ask_for_symbol
    TerminalInterface.ask_for_symbol
    selected_symbol = gets.chomp.upcase

    if !["X","O"].include? selected_symbol
      raise "You must input either 'X' or 'O' here"
      ask_for_symbol
    end
    selected_symbol
  end

  def check_for_winner
    WinChecker.check(@board)
  end
end