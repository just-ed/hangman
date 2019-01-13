# class that implements the process of the game
class Game
  MAX_MISTAKES = 7
  attr_reader :mistakes, :status, :letters, :good_letters, :bad_letters

  attr_accessor :version

  def initialize(word)
    # Save in @letters the hidden word from get_letters
    @letters = get_letters(word)

    # Number of mistakes, initial value - 0
    @mistakes = 0

    # Array that contains guessed letters
    @good_letters = []
    # Array that contains wrong guesses
    @bad_letters = []

    # Current status of the game - :in_progress, :won or :lost
    @status = :in_progress
  end

  # Convert the word into array of letters
  def get_letters(word)
    word.encode('UTF-8').downcase.split("")
  end

  def is_valid?(letter)
    valid_letters = 'a'..'z'
    valid_letters.include?(letter)
  end
  
  def repeated?(letter)
    @good_letters.include?(letter) || @bad_letters.include?(letter)
  end
  
  # Check if letter occurs in the word
  def is_good?(letter)
    @letters.include?(letter)
  end
    
  def add_letter_to(letters, letter)
    letters << letter
  end

  def mistakes_left
    MAX_MISTAKES - @mistakes
  end

  def max_mistakes
    MAX_MISTAKES
  end
  
  def solved?
    @letters.uniq.sort == @good_letters.uniq.sort
  end

  def lost?
    status == :lost
  end

  def in_progress?
    status == :in_progress
  end

  def won?
    status == :won
  end

  # Method for make decision what to do after the player's input
  def next_step(letter)
    letter = letter.downcase
    # Make sure if player has already won or lost or repeated the same letter
    return if @status == :lost || @status == :won
    return if repeated?(letter)

    if is_good?(letter)
      # If the letter occurs in the word - put the letter in good_letters
      add_letter_to(@good_letters, letter)

      @status = :won if solved?
    else
      # Else if player made a mistake - put the letter in bad_words and increment the number of mistakes
      add_letter_to(@bad_letters, letter)
      @mistakes += 1

      @status = :lost if @mistakes >= max_mistakes
    end
  end

  # Method for asking letter from player
  def ask_next_letter
    # Prompt for player's input until the valid letter
    letter = ''
    until is_valid?(letter)
      print "\nEnter the next letter: "
      letter = STDIN.gets.chomp
    end

    next_step(letter)
  end
end
