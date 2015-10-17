class TerminalInterface
  class << self
    def intro
      puts(<<-EOT)
      Hi Welcome to my Tic Tac Toe Game. It has built-in directional commands 
      to help you visualize a real tic tac toe board (multi dimensional) and helper functions to 
      see the board, score, and create a new game. The a standard 3x3 board looks like this:
      [
        [BoardLocation (0,0), BoardLocation (0,1), BoardLocation (0, 2)],
        [BoardLocation (1,0), BoardLocation (1,1), BoardLocation (1,2)],
        [BoardLocation (2,0), BoardLocation (2,1), BoardLocation (2,2)]
      ]

      To move, enter the location of where you want to go in x,y coordinate form (ex: '0,0' would go to the topleft corner of this board/first slot)
      To win, you must get 3 in a row (horizontally, vertically, or diagonally)

      First, how big do you want the board to be?
        Please input a width x height in the form of wxh (ex:'4x10' would give you a 4 x 10 board)
      EOT
    end

    def ask_player_to_make_move
      "It is the player's turn; make your move"
    end

    def output_board
    end

  end
end