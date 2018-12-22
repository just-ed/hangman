require_relative "game"
require_relative "result_printer"
require_relative "word_reader"

printer = ResultPrinter.new

word_reader = WordReader.new

# Save the name of the file that contains words for the game
words_file_name = "#{__dir__}/data/words.txt"

# Create an instance of the Game class. Ensure that the file with words exists and available for opening
begin
  game = Game.new(word_reader.read_from_file(words_file_name))
rescue NoMethodError
  abort "There are no words to guess. Please, ensure that the file with words exists :("
end

# The main cycle of the game. Game continues while status = 0
# status ==  0 - the word is not guessed and player has made less then 7 mistakes
# status ==  1 - the word is guessed, victory!
# status == -1 - the word is not guessed and player has made 7 mistakes - player lost
while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end

# Print the final result of the game
printer.print_status(game)
