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

  def check_vertical
    game_board = connect_four.board
    row = last_row(connect_four.last_entry)
    column = last_column(connect_four.last_entry)
    tick = 1
    last_piece = game_board[row][column]
    positive_idx = 1
    loop do
      return false if game_board[row + positive_idx] == nil
      check_below = game_board[row + positive_idx][column]
      if check_below == last_piece && row + positive_idx < 6
        tick += 1
        positive_idx += 1
      else
        return false
      end
      return true if tick == 4
    end
  end

  def check_diagonal_right
    game_board = connect_four.board
    row = last_row(connect_four.last_entry)
    column = last_column(connect_four.last_entry)
    right_positive_idx = 1
    right_negative_idx = -1
    left_positive_idx = 1
    left_negative_idx = -1
    tick = 1
    last_piece = game_board[row][column]
    loop do
      return true if tick == 4
      right_above = game_board[row + right_negative_idx][column + right_positive_idx]
      if game_board[row + left_positive_idx] == nil
        left_below = false
      else
        left_below = game_board[row + left_positive_idx][column + left_negative_idx]
      end
      
      if right_above == last_piece && row + right_negative_idx > -1 && column + right_positive_idx < 7
        tick += 1
        right_positive_idx += 1
        right_negative_idx -= 1
        next
      end

      if left_below == last_piece && row + left_positive_idx < 6 && column + left_negative_idx > -1
        tick += 1
        left_positive_idx += 1
        left_negative_idx -= 1
      elsif tick < 4
        return false
      end
    end
  end

  def check_diagonal_left
    game_board = connect_four.board
    row = last_row(connect_four.last_entry)
    column = last_column(connect_four.last_entry)
    right_positive_idx = 1
    right_negative_idx = -1
    left_positive_idx = 1
    left_negative_idx = -1
    tick = 1
    last_piece = game_board[row][column]
    loop do
      return true if tick == 4
      if game_board[row + right_positive_idx] == nil
        right_below = false
      else
        right_below = game_board[row + right_positive_idx][column + right_positive_idx]
      end
      left_above = game_board[row + left_negative_idx][column + left_negative_idx]

      if right_below == last_piece && row + right_positive_idx < 6 && column + right_positive_idx < 7
        tick += 1
        right_positive_idx += 1
        right_negative_idx -= 1
        next
      end

      if left_above == last_piece && row + left_negative_idx > -1 && column + left_negative_idx > -1
        tick += 1
        left_positive_idx += 1
        left_negative_idx -= 1
      elsif tick < 4
        return false
      end
    end
  end

  def draw
    game_board = connect_four.board
    game_board[0].all? { |element| element != '  '}
  end

  def check_win
     check_horizontal || check_vertical || check_diagonal_right || check_diagonal_left
  end

end