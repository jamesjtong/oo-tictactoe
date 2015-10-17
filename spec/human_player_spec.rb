require_relative 'spec_helper'

describe HumanPlayer do
  describe "#make_move" do
    let!(:board) do
      board = Board.new.tap { |b| b.set_up_board }
    end

    let!(:human_player) do
      human_player = HumanPlayer.new.tap { |player| player.start_new_game(board) }
    end

    it "changes a board location to be owned by the human" do
      allow_any_instance_of(Kernel).to receive(:gets) { "1, 1" }
      expect{human_player.make_move}.to change{board.available_spaces_remaining.length}.by(-1)
    end
  end

end