# class that implements the process of the game
class Game
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

    # Current status of the game
    # status =   0 - the game continues
    # status =   1 - victory
    # status = - 1 - defeat
    @status = 0
  end

  # Method returns the hidden word as an array of letters
  def get_letters(word)
    word.encode('UTF-8').split("")
  end

  # Method for make decision what to do after the player's input
  # Takes player's input as a parameter
  def next_step(letter)
    # Make sure if player has already won or lost or repeated the same letter
    return if @status == -1 || @status == 1
    return if @good_letters.include?(letter) || @bad_letters.include?(letter)

    # If the letter occurs in the word - put the letter in good_letters
    if @letters.include?(letter)
      good_letters << letter

      # If all letters are guessed - player won!
      @status = 1 if @letters.uniq.sort == @good_letters.uniq.sort

    # Else if player made mistake - put the letter in bad_words and increment the number of mistakes
    else
      @bad_letters << letter
      @mistakes += 1

      # If player made 7 mistakes - change the value of status to "-1" - player lost
      @status = -1 if @mistakes == 7
    end
  end

  # Method for asking letter from player
  def ask_next_letter
    valid_letters = 'a'..'z'

    # Prompt for player's input until the input occurs in valid_letters
    letter = ''
    until valid_letters.include?(letter)
      print "\nEnter the next letter: "
      letter = STDIN.gets.downcase.chomp
    end

    # Call next_step method and pass the letter entered by player
    next_step(letter)
  end
end
