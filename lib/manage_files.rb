# frozen_string_literal: true

require_relative 'interface_messages'

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
end
