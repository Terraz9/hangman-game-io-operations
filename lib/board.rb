# frozen_string_literal: true

require_relative 'manage_files'
require_relative 'winning_conditions'
require 'pry-byebug'
require 'yaml'

# Holds the creation of the random word, shows the underscore, and determines if there is a winner or not
class Board
  attr_reader :possible_words
  attr_accessor :current_guess, :counter_to_lose, :word_to_guess

  include ManageFiles
  include WinningConditions
  def initialize
    if load_game?
      update_game_variables
    else
      new_game
    end
  end

  def show_current_guess
    puts current_guess.join(' ')
    puts "#{counter_to_lose}/8"
  end

  # This logic is important to prevent finding multiple instances of a letter at once. For example, if the word is "ala"
  # and the user enters "a" it first shows "a _ _". Only if the user enters "a" again does it show "a _ a".
  def update_current_guess(letter_in_down_case)
    word_to_guess.each_with_index do |word_letter, i|
      next unless word_letter == letter_in_down_case
      next unless word_letter != current_guess[i]

      return current_guess[i] = word_letter
    end
    self.counter_to_lose += 1
  end

  def self.obtain_words
    arr = []
    File.open('data/google-10000-english-no-swears.txt', 'r') do |file|
      file.each do |word|
        arr << word.chomp
      end
    end
    arr
  end
  ALL_WORDS = obtain_words

  private

  def list_of_possibilities
    ALL_WORDS.select { |word| word.length >= 5 && word.length <= 12 }
  end

  def random_word
    possible_words.sample.split('')
  end

  def word_to_underscore
    word_to_guess.map { |_letter| '_' }
  end

  def new_game
    @possible_words = list_of_possibilities
    @word_to_guess = random_word
    @current_guess = word_to_underscore
    @counter_to_lose = 0
  end
end
