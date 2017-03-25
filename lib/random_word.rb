class RandomWord
  attr_reader :word

  # WORDS = %w(programming monkeybusiness rubyesque styleguide kip)
  WORDS = %w(kippen)

  # choose one random word from the list
  def initialize
    @word = WORDS.sample
  end

  def word_length
    return @word.length
  end

  # this function will find the letter position in the secret word, for example
  # if letter is 'a' and the secret word is 'calendar' then result is [1, 6]
  def positions_for(inletter)
    positions = []
    for current_letter_pos in 0 ... word_length
      wordletter = @word[current_letter_pos]
      # puts "#{i}: #{wordletter}"
      if inletter == wordletter
        # puts 'yaaay'
        positions << current_letter_pos
      end
    end
  return positions
  end
end
