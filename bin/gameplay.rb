require_relative '../lib/board'
require_relative '../lib/interface_messages'
require_relative '../lib/manage_files'
require_relative '../lib/player'
require 'pry-byebug'

class Gameplay
  include InterfaceMessages
  attr_accessor :board, :player

  def initialize
    introduction_message
    @board = Board.new
    @player = Player.new
    game_loop
  end

  def game_loop
    message_start_game
    loop do
      game_round
      break if board.game_over?
    end
    board.pick_winner
  end

  def game_round
    board.show_current_guess
    letter = player.pick_letter
    board.update_current_guess(letter)
  end
end

new_game = Gameplay.new
