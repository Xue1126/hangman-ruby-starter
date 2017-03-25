require File.expand_path("../random_word", __FILE__)

class Hangman
  def initialize
    @random_word = RandomWord.new
    # @bad_guesses_left = 10
    @guesesses_positions = []
    @bad_guesses_list = []
    for i in 0 ... @random_word.word_length do
      @guesesses_positions <<  "_"
    end
    # print @correct_guesses.join(" ") + "\n"
  end

  # this function plays the game
  def play
    # puts "Hi from lib/hangman.rb!"
    show_game
    while ! game_over?
      letter = ask_letter
      check_letter(letter)
      show_game
    end
  end

  # this shows the current state of the game on the terminal
  ## puts ["red", "blue", "yellow"].join(", ")
  def show_game
    print @guesesses_positions.join(" ") + "    ||    "
    print @bad_guesses_list.join(" ") + "\n"

  end

  # keep asking the user for a letter until he chooses an acceptable one
  def ask_letter
    is_valid = false
    while !is_valid
      print 'please enter a letter... '
      user_input = gets.chomp.downcase
      if user_input.length == 1
        if user_input =~ /[a-z]/
          is_valid = true
        end
      end
      # puts user_input, is_valid
    end
    return user_input
  end

  # check whether a letter is correct (and where) or incorrect
  def check_letter(letterx)
    # puts 'checking letter', letter
    positions = @random_word.positions_for(letterx)
    if positions.length > 0

      # print positions
      for pos in positions
        # puts pos
        @guesesses_positions[pos] = letterx
      end
    else
      @bad_guesses_list << letterx
    end
  end


  def game_over?
    if @bad_guesses_list.length >= 10
      puts "You've been hanged for bad spelling."
      return true
    end
    if @random_word.is_this_word_correct?(@guesesses_positions)
      puts "You won."
      return true
    end
    return false
  end
end

