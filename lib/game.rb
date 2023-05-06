# frozen_string_literal: true

require_relative 'connect_four'
require_relative 'connect_four_checker'

# todo improve UI, write more tests for nil bugs and out of bound issues for check_win

class Game
  include ConnectFourChecker
  attr_accessor :connect_four

  def initialize
    @connect_four = ConnectFour.new
  end

  def play_game
    connect_four.print_board
    loop do
      player1_turn
      if check_win
        puts 'player 1 wins!'
        break
      elsif draw
        puts 'DRAW!'
        break
      end
      player2_turn
      if check_win
        puts 'player 2 wins!'
        break
      elsif draw
        puts 'DRAW!'
        break
      end
    end
    play_again
  end

  def play_again
    puts "Play again? Y/n"
    input = yes_or_no

    if input == 'Y'
      self.connect_four = ConnectFour.new
      play_game
    end
  end

  def yes_or_no
    loop do
      input = gets.chomp
      return input if input == 'Y' || input == 'n'
      puts 'Please enter a valid input'
    end  
  end

  def player1_turn
    puts 'player 1 enter a column'
    player1 = player_input #update this for player_input
    connect_four.insert_piece(player1, '🔴')
    connect_four.print_board
  end

  def player2_turn
    puts 'player 2 enter a column'
    player2 = player_input #update this for player_input
    connect_four.insert_piece(player2, '🟡')
    connect_four.print_board
  end

  def clean_input
    loop do
      input = gets.chomp.to_i
      return input.to_i if input.between?(1, 7)
      puts 'Please enter a valid input'
    end
  end

  def row_full?(column)
    top_row = connect_four.board[0][column - 1]
    if top_row != '  '
      true
    else
      false
    end
  end

  def player_input
    loop do
      column = clean_input
      if row_full?(column)
        puts 'column is full, choose another!'
        next
      else
        return column
      end
    end
  end
end

# game = Game.new
# game.play_game
