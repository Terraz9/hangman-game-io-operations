# frozen_string_literal: true

require_relative 'interface_messages'
require 'yaml'
module ManageFiles
  include InterfaceMessages
  DIRECTORY = 'data'
  FILENAME = 'data/save_game.yml'

  def save_game
    Dir.mkdir(DIRECTORY) unless Dir.exist?(DIRECTORY)
    game_state = {
      word: word_to_guess,
      current: current_guess,
      counter: counter_to_lose
    }

    yaml_string = YAML.dump(game_state)

    File.write(FILENAME, yaml_string)
    puts "Game saved to #{FILENAME}"
  end

  def load_game?
    loop do
      message_load_game
      input = gets.chomp.upcase

      return true if input == 'Y'
      return false if input == 'N'

      puts 'Not Valid'
    end
  end

  def update_game_variables
    Dir.mkdir(DIRECTORY) unless Dir.exist?(DIRECTORY)
    if File.exist?(FILENAME)
      loaded_data = YAML.load_file(FILENAME, permitted_classes: [Symbol])
      self.word_to_guess = loaded_data[:word]
      self.current_guess = loaded_data[:current]
      self.counter_to_lose = loaded_data[:counter]
    else
      puts "There is not saved game in '#{DIRECTORY}' directory"
    end
  end
end
