# frozen_string_literal: true

require_relative 'player'
require_relative 'connect_four'

class Game
  attr_accessor :connect_four

  def initialize
    @connect_four = ConnectFour.new
  end

  # issue: game continues to next player turn although a certain column is maxed...
  def play_game
    loop do
      connect_four.print_board
      puts 'player 1 enter a column'
      player1 = clean_input
      connect_four.insert_piece(player1, '🔴')
      connect_four.print_board
      break if check_win
      puts 'player 2 enter a column'
      player2 = clean_input
      connect_four.insert_piece(player2, '🟡')
      connect_four.print_board
      break if check_win
    end
  end

  def clean_input
    loop do
      input = gets.chomp.to_i
      return input.to_i if input.between?(1, 7)
      puts 'Please enter a valid input'
    end
  end

  def check_win
    false
  end
end

game = Game.new
game.play_game
