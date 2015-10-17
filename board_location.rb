class BoardLocation
  attr_accessor :owned_by

  def initialize
    return self
  end

  def empty?
    owned_by.nil?
  end

end