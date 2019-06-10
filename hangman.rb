require_relative "lib/game"
require_relative "lib/result_printer"
require_relative "lib/word_reader"

VERSION = '"Hangman" game. Version 5'

word_reader = WordReader.new
words_file_name = "#{__dir__}/data/words.txt"
word = word_reader.read_from_file(words_file_name)

begin
  game = Game.new(word)
rescue NoMethodError
  abort "There are no words to guess. Please, make sure that the file with words exists."
end

game.version = VERSION

printer = ResultPrinter.new(game)

while game.in_progress?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
