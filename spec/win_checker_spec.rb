require_relative 'spec_helper'

describe WinChecker do
  let(:ai_player) { AiPlayer.new("X")}
  let(:human_player) { HumanPlayer.new("O")}

  describe ".check" do
    it "checks for a win" do

    end
    context "when there is no current 3 in a row win on the board" do
      let(:clean_board) do
        board = Board.new("4x4")
        board.set_up_board
        board
      end

      let(:partially_filled_board) do
        board = Board.new("4x4")
        board.set_up_board
        board.mark_taken(0,0,human_player)
        board.mark_taken(0,1,ai_player)
        board.mark_taken(0,2,ai_player)
        board
      end

      context "when there is no winning combination on a clean board" do
        it "returns false" do
          expect(WinChecker.check(clean_board)).to eq false
        end
      end
      
      context "when there is no winning combination on a partially_filled_board board" do
        it "returns false" do
          expect(WinChecker.check(partially_filled_board)).to eq false
        end
      end


    end

    context "when there is a current 3 in a row win on the horizontally" do
      let(:board_with_a_win) do
        board = Board.new("4x4")
        board.set_up_board
        board.mark_taken(0,0,ai_player)
        board.mark_taken(0,1,ai_player)
        board.mark_taken(0,2,ai_player)
        board
      end

      it "returns true" do
      end      
    end

  end
end