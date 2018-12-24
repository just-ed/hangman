# class that implements the process of the game
class Game
  MAX_MISTAKES = 7
  attr_reader :mistakes, :status, :letters, :good_letters, :bad_letters

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
    word.encode('UTF-8').split("")
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
  
  def solved?
    @letters.uniq.sort == @good_letters.uniq.sort
  end

  def lost?
    @mistakes == MAX_MISTAKES
  end
  
  def is_valid?(letter)
    valid_letters = 'a'..'z'
    valid_letters.include?(letter)
  end
  
  # Method for make decision what to do after the player's input
  def next_step(letter)
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

      @status = :lost if lost?
    end
  end

  # Method for asking letter from player
  def ask_next_letter
    # Prompt for player's input until the input occurs in valid_letters
    letter = ''
    until is_valid?(letter)
      print "\nEnter the next letter: "
      letter = STDIN.gets.downcase.chomp
    end

    next_step(letter)
  end
end
