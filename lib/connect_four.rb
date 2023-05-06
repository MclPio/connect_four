class ConnectFour
  attr_accessor :board, :last_entry

  def initialize
    @board = Array.new(6) { Array.new(7, "  ") }
    @last_entry = ''
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
        self.last_entry = "#{5 - idx} #{column - 1}"
        board[5 - idx][column - 1] = color
        break
      end
    end
  end
end
