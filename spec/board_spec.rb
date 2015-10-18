require_relative 'spec_helper'

describe Board do
  let!(:clean_board) do
    board = Board.new("4x4")
    board.set_up_board
    board
  end

  let(:ai_player) { AiPlayer.new("X")}
  let(:human_player) { HumanPlayer.new("X")}

  describe "#set_up_board" do
    context "when board size is the default 3x3" do
      it "sets up the board correctly according to grid specifications" do
        expect(BoardLocation).to receive(:new).exactly(9).times
        subject.set_up_board
      end
    end

    context "when board size is 4x12" do
      subject { Board.new("4x12") }
      it "sets up the board correctly according to grid specifications" do
        expect(BoardLocation).to receive(:new).exactly(48).times
        subject.set_up_board
      end
    end
  end

  describe "#available_spaces_remaining" do
    context "when the board is empty" do
      it "outputs all board locations" do
        expect(clean_board.available_spaces_remaining.length).to eq(16)
      end
    end

    context "when the board is not empty" do
      let!(:partially_filled_board) do
        board = Board.new("4x4")
        board.set_up_board
        board.grid[0][0].owned_by = human_player
        board.grid[0][1].owned_by = ai_player
        board.grid[0][2].owned_by = ai_player
        board
      end

      it "outputs the non-owned board locations" do
        expect(partially_filled_board.available_spaces_remaining.length).to eq(13)
      end
    end
  end

  describe "#mark_taken" do
    it "changes the owned_by state of board_location" do
      expect(clean_board.grid[1][1].owned_by).to eq(nil)
      clean_board.mark_taken(1,1,ai_player)
      expect(clean_board.grid[1][1].owned_by).to eq(ai_player)
    end
  end
end