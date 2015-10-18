require_relative 'spec_helper'

describe AiPlayer do
  describe "#make_move" do
    let!(:board) do
      board = Board.new.tap { |b| b.set_up_board }
    end

    let!(:ai_player) do
      ai_player = AiPlayer.new("o").tap { |player| player.start_new_game(board) }
    end

    it "changes a board location to be owned by the ai" do
      expect{ai_player.make_move}.to change{board.available_spaces_remaining.length}.by(-1)
    end
  end

end