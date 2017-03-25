class RandomWord
  attr_reader :word

  WORDS = %w(programming monkeybusiness rubyesque styleguide)

  def initialize
    @word = WORDS.sample
  end

  def word_length
    return @word.length
  end

  def positions_for(characters: [])
    # for you to implement :)
  end
end
