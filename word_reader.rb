# Class for getting the hidden word
class WordReader
  # Method for getting the word from the file
  def read_from_file(file_name)
    # Open the file for reading
    file = File.new(file_name, "r:UTF-8")
    # Save every line from the file to an array
    lines = file.readlines
    # Close the file
    file.close

    # Return random word from the array
    lines.sample.downcase.chomp
  end
end
