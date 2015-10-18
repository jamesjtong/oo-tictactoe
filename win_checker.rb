class WinChecker
  def self.check(board)
    return false if board.last_spot_taken.nil?
    check_area_around_last_spot_for_win(board.last_spot_taken)
  end


  def self.check_area_around_last_spot_for_win(last_spot_taken)
    lst = last_spot_taken
    winning_map = [
      [lst, lst.top, lst.top && lst.top.top],
      [lst, lst.top_left, lst.top_left && lst.top_left.top_left],
      [lst, lst.top_right, lst.top_right && lst.top_right.top_right],
      [lst, lst.left, lst.left && lst.left.left],
      [lst, lst.bottom_left, lst.bottom_left && lst.bottom_left.bottom_left],
      [lst, lst.bottom, lst.bottom && lst.bottom.bottom],
      [lst, lst.bottom_right, lst.bottom_right && lst.bottom_right.bottom_right],
      [lst, lst.right, lst.right && lst.right.right],
      [lst, lst.top, lst.bottom],
      [lst, lst.left, lst.right],
      [lst, lst.top_left, lst.bottom_right],
      [lst, lst.top_right, lst.bottom_left]
    ]

    filtered_winning_map = filter_out_void_and_null_win_maps(winning_map)

    filtered_winning_map.any? do |potential_win_location|
      symbols_for_location = potential_win_location.map(&:symbol)
      symbols_for_location.uniq.length == 1 && symbols_for_location.uniq[0] != nil
    end

  end

  def self.filter_out_void_and_null_win_maps(potential_winning_map)
    filtered_by_valid_length_maps = potential_winning_map.select do |win_map|
      win_map.all? do |map|
        map.respond_to?(:symbol) && map.symbol != "V"
      end
    end

    filtered_by_valid_length_maps.select {|m| m.length === 3}
  end
end