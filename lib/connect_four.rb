# frozen_string_literal: true

# 🔴 🟡
#needs a 7 column, 6 row board
# yellow / red colors
#pieces fall stright down
# where any piece of same color connects 4 times horizontal, vertical or diagonal. color wins
class ConnectFour
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, "  ") }
  end

  def print_board
    puts "------------------------------------"
    board.each do |row|
      row_str = "|"
      row.each { |cell| row_str += " #{cell} |" }
      puts row_str
      puts "------------------------------------"
    end
    puts "   1    2    3    4    5    6    7  "
  end

  def insert_piece(column, color)
    board.reverse.each_with_index do |row, idx|
      if row[column - 1] != "  "
        next
      elsif row[column - 1] == "  "
        board[5 - idx][column - 1] = color
        break
      end
    end
  end
end

# x = ConnectFour.new
# # x.board[5][0] = '🔴'
# # x.board[5][1] = '🟡'
# # x.board[4][0] = '🟡'
# # x.board[5][5] = '🟡'
# # x.board[5][6] = '🟡'
# x.insert_piece(1, '🔴')
# x.insert_piece(1, '🟡')
# x.insert_piece(1, '🔴')
# x.insert_piece(1, '🟡')
# x.insert_piece(1, '🔴')
# x.insert_piece(1, '🟡')
# x.insert_piece(1, '🔴')
# x.insert_piece(1, '🟡')
# x.insert_piece(1, 'WOOOOOT')
# x.board.each {|i| p i}
