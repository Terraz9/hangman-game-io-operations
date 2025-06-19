# frozen_string_literal: true

require_relative 'interface_messages'

class Player
  include InterfaceMessages
  attr_accessor :current_choice

  def player_turn(board)
    loop do
      ask_letter
      self.current_choice = gets.chomp.downcase
      if a_save?
        return board.save_game
      elsif a_letter?
        return board.update_current_guess(current_choice)
      end

      puts 'Not valid input'
    end
  end

  def a_save?
    current_choice.is_a?(String) && current_choice == '1'
  end

  def a_letter?
    current_choice.is_a?(String) && current_choice.match?(/\A[a-z]\z/)
  end
end
