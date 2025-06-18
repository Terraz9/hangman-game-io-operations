module InterfaceMessages
  def introduction_message
    puts 'Welcome to the Hangman Game created by Terraz
You will have 8 tries to guess the word and win!'
  end

  def message_start_game
    puts 'Pick a letter!'
  end

  def ask_letter
    puts 'Select one letter of the alphabet A through Z. Press 1 to save the game'
  end

  def message_save_game
    puts 'Y/n Would you like to save the game?'
  end

  def message_load_game
    puts 'Y/n Would you like to load an old game?'
  end
end
