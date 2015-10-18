class VoidLocation
  attr_accessor :symbol
  attr_reader :top, :top_left, :top_right, :left, :right, :bottom, :bottom_left, :bottom_right

  def initialize
    self.symbol = "V"
  end
end