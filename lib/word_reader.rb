# Class for getting the hidden word
class WordReader
  # Method for getting the word from the file
  def read_from_file(file_name)
    lines = File.readlines(file_name)
    
    lines.sample.chomp
  end
end
