module WinningConditions
  def counter_max?
    counter_to_lose == 8
  end

  def words_match?
    current_guess == word_to_guess
  end

  def pick_winner
    puts "The word was #{word_to_guess.join('')}"
    if counter_max?
      puts 'The winner is the Computer'
    elsif words_match?
      puts 'The winner is the Human, congratulations'
    end
  end

  def game_over?
    if counter_max? || words_match?
      true
    else
      false
    end
  end
end
