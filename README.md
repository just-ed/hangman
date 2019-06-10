The program written in Ruby 2.5.3

# The Hangman Game

## Game rules
The word to guess is represented by a row of dashes, representing each letter of the word. In most variants, 
proper nouns, such as names, places, and brands, are not allowed. Slang words, sometimes referred to as informal or 
shortened words, are also not allowed. If the guessing player suggests a letter which occurs in the word, the program
writes it in all its correct positions. If the suggested letter or number does not occur in the word, the program draws
one element of a hanged man stick figure as a tally mark.

The player wins by guessing all the letters that appears in the word, thereby completing the word, before the diagram 
is completed. If the player makes enough incorrect guesses to allow the program to complete the diagram, the game is 
over with the player losing. 

## How to run the program
Before running the program make sure you have **Ruby** installed on your machine.  
Enter the line below:
```
ruby hangman.rb
```

## How to add new words
Open the file **"words.txt"** in **"data"** folder and input the words in it.   
Every single words must be written on new line.  
Save and close the file. Enjoy playing with new words :)
