require_relative 'spec_helper'

describe AiPlayer do
  describe "#make_move" do
    it "changes a board location to be owned by the ai" do
      ai_player = AiPlayer.new
      board = Board.new
      board.set_up_board
      ai_player.start_new_game(board)
      expect{ai_player.make_move}.to change{board.available_spaces_remaining.length}.by(-1)
    end
  end

end