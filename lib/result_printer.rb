# Class for printing intermediate and final results of the game
class ResultPrinter
  def initialize(game)
    # Array that contains pseudographics (7 "images")
    @status_image = []

    # Counter for cycle
    counter = 0

    # Write the images from the files to @status_image
    # The index of the element in the array corresponds to the number of mistakes
    until counter > game.max_mistakes
      # Path to the file with so called images
      file_name = "#{__dir__}/../image/#{counter}.txt"

      # Make sure that file with image exists
      if File.exist?(file_name)
        # If true - write it to @status_image
        file = File.new(file_name, "r:UTF-8")
        @status_image << file.read
        file.close
      else
        # Else - replace the image with stub
        @status_image << "\n [ image not found ] \n"
      end

      # Increment counter
      counter += 1
    end
  end

  # Method that prints the image according to the number of made mistakes
  def print_hangman(mistakes)
    puts @status_image[mistakes]
  end

  # Method for printing the current status of the game
  def print_status(game)
    cls

    puts game.version

    # Print the word with underscores instead of not guessed letters
    puts "\nWord: #{get_word_for_print(game.letters, game.good_letters)}"
    # Print wrong letters separated with commas
    puts "Mistakes: #{game.bad_letters.join(", ")}"

    # Print the image for the current number of made mistakes
    print_hangman(game.mistakes)

    if game.status == :lost
      # If player lost - print a message about it and show the word
      puts "\nGame over :("
      puts "The word was: " + game.letters.join("")
    elsif game.status == :won
      # If player won - congratulate
      puts "\nYou won! Congratulations! :)"
    else
      # If the game is not over, print the number of mistakes that are available to make
      if game.mistakes != 6
        puts "You have left: #{game.mistakes_left} mistakes"
      else
        puts "You have left: 1 mistake. Be careful! "
      end
    end
  end

  # Method that prints the hidden word with underscores instead of not guessed letters
  def get_word_for_print(letters, good_letters)
    result = ""

    letters.each do |letter|
      result += if good_letters.include?(letter)
                  letter + " "
                else
                  "_ "
                end
    end

    result
  end

  def cls
    system("clear") || system("cls")
  end
end
