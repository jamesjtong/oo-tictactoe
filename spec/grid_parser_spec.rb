require_relative 'spec_helper'

describe GridParser do
  describe "#parse_grid_width_height" do
    context "when given widths and heights that are single digits" do
      it "correctly parses them" do
        expect(GridParser.new.parse_grid_width_height("3x3")).to eq([3,3])
      end
    end

    context "when given widths and heights that are double digits" do
      it "correctly parses them" do
        expect(GridParser.new.parse_grid_width_height("33x43")).to eq([33,43])
      end
    end
  end  
end