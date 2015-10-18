class TerminalInterface
  class << self
    def intro
      puts(<<-EOT)
      Hi Welcome to my Tic Tac Toe Game. It has built-in directional commands 
      to help you visualize a real tic tac toe board (multi dimensional) to 
      see the board, set the symbol, set the board size, and create a new game. 
      The a standard 3x3 board looks like this (notice the coordinates are based on distance from the origin:
      [
        [BoardLocation (0,0), BoardLocation (1,0), BoardLocation (2,0)],
        [BoardLocation (0,1), BoardLocation (1,1), BoardLocation (2,1)],
        [BoardLocation (0,2), BoardLocation (1,2), BoardLocation (2,2)]
      ]

      To move, enter the location of where you want to go in x (right of origin),y (bottom of origin) coordinate form
      '0,0' would be the origin spot

      examples:
      entering '0,0' would go to the topleft corner of this board/first slot
      entering '1,2' would move you 1 right and 2 spaces below the origin (0,0)
      entering '2,2' would move you to the bottom right of the board on a '3x3' board

      To win, you must get 3 in a row (horizontally, vertically, or diagonally)

      EOT
    end

    def ask_for_size_of_board
      puts "\nFirst, how big do you want the board to be?\n
        Please input a width x height in the form of wxh (ex:'4x10' would give you a 4 x 10 board)"
    end

    def ask_player_to_make_move
      puts "\nIt is the player's turn; make your move"
    end

    def ask_for_symbol
      puts "\nWhat symbol do you want to be 'X' or 'O'? Enter 'x' for 'X' or 'o' for 'O'"
    end

    def announce_winner(winner)
      puts "\n#{winner} has won!!!!!\n"
    end

    def ask_to_play_again
      puts "\nWould you like to play again? Type 'y' or 'yes' if you would like to play again"
    end

    def announce_who_goes_first(turn_owner)
      puts "\n#{turn_owner} has won the roll and gets to go first!"
    end
  end
end