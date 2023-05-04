module ConnectFourChecker
  def last_row(last_entry)
    last_entry.split(' ').map{ |item| item.to_i}[0]
  end

  def last_column(last_entry)
    last_entry.split(' ').map{ |item| item.to_i}[1]
  end

  def check_horizontal
    game_board = connect_four.board
    row = last_row(connect_four.last_entry)
    column = last_column(connect_four.last_entry)
    positive_idx = 1
    negative_idx = -1
    tick = 1
    last_piece = game_board[row][column]
    puts "[#{row}][#{column}]"
    loop do
      check_right = game_board[row][column + positive_idx]
      check_left = game_board[row][column + negative_idx]  
      if check_right == last_piece && column + positive_idx < 8
        tick += 1
        positive_idx += 1
      else
        positive_idx = 10
      end

      if check_left == last_piece && column + negative_idx > -1
        tick += 1
        negative_idx -= 1
      else
        negative_idx = -10
      end

      return true if tick == 4
      return false if column + positive_idx > 8 && column + negative_idx < -1
    end
  end
end