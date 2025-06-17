# frozen_string_literal: true

require_relative 'interface_messages'

class Player
  include InterfaceMessages
  attr_accessor :letter_choice

  def initialize
  end

  def pick_letter
    loop do
      ask_letter
      choice = gets.chomp.downcase
      is_valid = choice.is_a?(String) && choice.match?(/\A[a-z]\z/)
      return self.letter_choice = choice if is_valid

      puts 'Not valid input, it should be a letter from A to Z'
    end
  end
end
