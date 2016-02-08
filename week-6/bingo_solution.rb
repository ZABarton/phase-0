# A Nested Array to Model a Bingo Board SOLO CHALLENGE

# I spent [#] hours on this challenge.


# Release 0: Pseudocode
# Outline:

# Create a method to generate a letter ( b, i, n, g, o) and a number (1-100)
#   Define method to take no arguments
#   We need to generate two random numbers.
#   First random number should be between 0 to 4 to represent the index (column)
#     Match these numbers to letters: 0 => B, 1 => I, etc
#     We could have a hash that stores these corresponding pairs
#   Second random number should be between 1 to 100 to represent the number
#   Return the column value and the number (but display the letter value and number)

# Check the called column for the number called.
#   Define the method to take two arguments, the column value and the number to find
#   Iterate through the nested array
#     Given the column index, we want to check that index only in each sub-array
#     So if the column index was 0, we would only check the first element in each sub-array
    
# If the number is in the column, replace with an 'x'
#   This can go within our checking column method
#   If the number is found during the iteration, we replace that element with the string "x"
#   If the number is not found, we do nothing

# Display a column to the console
#   This is an iteration through each of the sub-arrays
#   We pick an index between 0 and 4, and generate that index for every sub-array
#   If we display using the puts command, we will get line breaks after every number to form a column.

# Display the board to the console (prettily)
#   One idea is to convert every row (sub-array) into a string of fixed length
#   You can include "|" in these strings to separate each number
#   Followed by a string like "------" to form a makeshift grid

# Initial Solution

# class BingoBoard

#   @@col = ['B','I','N','G','O']  

#   def initialize(board)
#     @board = board
#   end

#   def display()
#     puts ""

#     row = 0
#     divider = "|----|----|----|----|----|"
    
#     puts "| #{@@col[0]} | #{@@col[1]} | #{@@col[2]} | #{@@col[3]} | #{@@col[4]} |"
#     puts divider
#     while row < @board.length
#       puts "| #{@board[row][0]} | #{@board[row][1]} | #{@board[row][2]} | #{@board[row][3]} | #{@board[row][4]} |" 
#       puts divider
#       row += 1
#     end
    
#     puts ""
  
#   end

#   def call
#     @column_number = rand(0..4)
#     @column_heading = @@col[@column_number]
#     @target_number = rand(1..100)
#     puts "Next number is #{@column_heading}-#{@target_number}!"
#   end

#   def check()
#     row = 0
#     while row < @board.length
#       if @board[row][@column_number] == @target_number
#         @board[row][@column_number] = "x"
#       end
#       row += 1
#     end 
#   end

# end

# INITIAL REFACTORING
# Use the rjust method to pad one character strings/numbers with leading spaces
# Use iteration for the display method for both columns AND rows
# Add method calls within methods to perform a chain of call-check-display
#   In a real game of bingo, these steps are always follow one another
#   So each method retains its function but are always performed in order

# Add method for generating legal bingo boards
# PSEUDOCODE

#   Input: BingoBoard.new (no arguments)
#   Output: 5x5 nested array
#     Numbers in first column within range 1-15
#     Numbers in second column within range 16-30, etc
#     Center square marked with "X" at beginning
#     No repeated numbers!
# 
#   Steps: 
#   First, generate each column as an array
#     Loop through generation a random number within the specified range
#       If that number does not already exist within the array, push it to the array
#       Else discard the number
#     Stop when the array contains five numbers
#     Proceed to next column, increase the random number range
#     Continue until five arrays are created
#
#   Second, place the numbers in the desired nested array format
#     Iterate through each generated array by index
#       Push all of the first elements into a new array of 5
#       Then push all of the second elements into a second array of 5
#     Continue until all columns have been transposed to rows
#     NOTE: Check if there's a method to transpose an array - this sounds like something that should exist
#
#   Third, create free space
#     Replace the third object of the third array with an "X" string
#
#   Finally, set this array to instance variable @board
#
#   BONUS: call the display method within the initialize method
#
# Of course, if we change the board generation method, we need to make sure we still call valid numbers

# FURTHER REFACTORING: Fix the call method
# PSEUDOCODE:
# Input: call()
# Output: The method should return the correct column position and target number
#   It should DISPLAY the column heading
# Steps:
#   Generate a random number to generate column position (first through fifth)
#   Draw the heading from the class variable
#   The specific range can be determined from the column position
#     Generate a random number from 1 to 15
#       Add 15 to this number for every column over from the first
#       So, any number in the any column could be expressed by random_number + (15 * column_position)
#   Display the letter heading and number called
#   Store the column position for searching in the check method

# But what fun is a game if you can't actually win?

# EVEN FURTHER REFACTORING: Add victory conditions
# PSEUDOCODE:
# Input: The board state contained in @board
# Output: Victory message if victory conditions are met
# Steps:
#   Define a victory method that will check the board for certain configurations of "X" strings in the nested array
#   A player can win if an entire row is marked X
#     In other words, if any one of the five sub-arrays contains elements ONLY consisting of "X"
#   A player can also win if an entire column is marked X
#     In other words, if every specific index of all five sub-arrays contains the element "X"
#   Finally, a player can win if either diagonal is marked with X
#     Specific indexes must contain specific element "X"
#   If any of these conditions evaluate true, return a victory message
#   Else continue to call numbers
#
# We can call this method within the check method to keep the victory conditions separate from the specific number check
#   Call AFTER we check the board for the number called

# Watching a random game of bingo played by the computer is long and tiresome. Let's add debug code!

# ANOTHER BIT OF REFACTORING: Force the next call
# PSEUDOCODE:
# Input: Pass an integer into the force method
# Output: Mark that integer on the board as "X"
# Steps:
#   Basically the call method but we specify the number instead of relying on the RNG
#   Set instance variable @target_number to the argument
#   Set column number based on target number so check method works
#   Call the check method

# What else can we do? If there's more time this week, try the following:
#   Add support for multiple boards - multiplayer bingo!
#   Create a menu - Number of Boards, Create Boards, Start Game
#   Automate the game process. Repeat the chain of methods until a board returns bingo.

 
class BingoBoard

  @@col = ['B','I','N','G','O']  

  # def initialize(board)
  #   @board = board
  # end

  def initialize()
    @board = [] # empty board
    number_of_columns = 0 # how many columns exist on the empty board
    range_start = 1 # the minimum number allowed on the board
    
    until number_of_columns == 5 # finish generating board after 5 columns are created
      new_row = []
      until new_row.length == 5 # generate column as a row of 5 unique elements within a given range 
        number = rand(range_start..range_start + 14) 
        if new_row.include?(number) == false
          new_row << number
        end
      end
      @board << new_row
      number_of_columns += 1
      range_start += 15
    end    
    
    # change rows to columns, generate free space, display new board
    @board = @board.transpose
    @board[2][2] = "X"
    display()
  end

  def call
    @column_number = rand(0..4)
    column_heading = @@col[@column_number]
    @target_number = rand(1..15) + (15*@column_number)
    puts "Next number is #{column_heading}-#{@target_number}!"
    check()
  end

  # def number_of_players
  #   print "How many players? "
  #   num_players = gets_chomp
  # end

# DEVELOPER DEBUG CODE! COMMENT THIS OUT BEFORE RELEASE!
  def force(number) 
    @target_number = number
    if number % 15 == 0
      @column_number = (number/15) - 1
    else
      @column_number = (number/15)
    end   
    check()
  end
# DEVELOPER DEBUG CODE! COMMENT THIS OUT BEFORE RELEASE!

  def check()
    row = 0
    while row < @board.length
      if @board[row][@column_number] == @target_number
        @board[row][@column_number] = "X"
      end
      row += 1
    end
    display()
    victory()  
  end

  def display()
    
    divider = "|----|----|----|----|----|"
    heading_divider = "|====|====|====|====|====|"

    column = 0 
    puts ""
    while column < @@col.length
      print "| #{@@col[column].to_s.rjust(2, " ")} " 
      column += 1
    end
    
    puts "|"
    puts heading_divider

    row = 0
    while row < @board.length
      column = 0
      while column < @board[row].length
        print "| #{@board[row][column].to_s.rjust(2, " ")} " 
        column += 1
      end
      puts "|"
      puts divider
      row += 1
    end
    
    puts ""
  end

  def victory()
    # check horizontal victory condition
    @board.each do |row|
      if row.count("X") == 5
        puts "BINGO! - Horizontal Row"
        return :bingo
      end
    end

    # check vertical victory condition
    horizontal = @board.transpose
    horizontal.each do |row|
      if row.count("X") == 5
        puts "BINGO! - Vertical Column"
        return :bingo
      end
    end

    # check diagonals victory condition
    diagonal = (0..(@@col.length-1)).to_a
    diag_win_1 = []
    diag_win_2 = []
    
    diagonal.each do |column|
      diag_win_1 << @board[column][column]
      diag_win_2 << @board[column][(@@col.length-1) - column]
    end
    
    if diag_win_1.count("X") == 5 
      puts "BINGO! - Diagonal"
      return :bingo
    elsif diag_win_2.count("X") == 5
      puts "BINGO! - Diagonal"
      return :bingo
    end
  end

end

#DRIVER CODE (I.E. METHOD CALLS) GO BELOW THIS LINE
board = [[47, 44, 71, 8, 88],
        [22, 69, 75, 65, 73],
        [83, 85, 97, 89, 57],
        [25, 31, 96, 68, 51],
        [75, 70, 54, 80, 83]]

new_game = BingoBoard.new()

#Reflection
=begin

How difficult was pseudocoding this challenge? What do you think of your pseudocoding style?

  I really enjoy laying out the problem ahead of time by writing out pseudocode. It took some
  time to adjust from writing pseudocode using ruby commands to writing pseudocode in plain
  english. However, I think there's a huge benefit to breaking down the problem into smaller
  steps in plain language. If you can break the problem down using easy to understand language,
  it becomes easier to translate those ideas into ruby and solve the problem one step at a time.

What are the benefits of using a class for this challenge?

  Defining all of the methods within a class for making bingo boards allows you to apply all of
  those behaviors to any bingo board game generated through this class. So, for instance, if you
  wanted to generate multiple bingo boards for several players, you could create several instances
  of boards that each share the class methods for finding numbers, marking them with "X", and
  checking for victory conditions.

How can you access coordinates in a nested array?

  You can access any coordinate within a nested array by working from the outside and going in.
  For instance, the first index you select applies to the outermost array. Then, the next index
  applies to the next level of arrays. As long as there are deeper levels of arrays, you would just
  chain the indexes together to point to a unique, specific address.

What methods did you use to access and modify the array?

  To access and modify the array, all I did was check the array, row by row, for the specific number.
  There weren't any new methods used here - if the number was found, we just replaced that value at
  that specific address with the "X" string.  

Give an example of a new method you learned while reviewing the Ruby docs. 
Based on what you see in the docs, what purpose does it serve, and how is it called?

  I learned how to use the .rjust method when creating my display method. The
  rjust method lets you justify strings to the right by adding a certain number
  of leading characters. The rjust method takes two arguments, a number and a string.
  The number provides the minimum length of the string, and the string represents
  the character used for padding. I used this to specify that each value in the grid
  was two spaces long. This makes each square in the grid the same width, so the lines
  of the grid always remain constant.

How did you determine what should be an instance variable versus a local variable?

  Local variables could be used within certain methods if you needed to create a counter
  for a while loop. Since you don't need to store those individual counters when the method
  isn't running, it's okay to use local variables in this situation since they're only called
  when needed. Instance variables are needed when information has to be passed from one method
  to another. This allows the call method to generate the target number as an instance variable,
  and the check method to use that instance variable to find it in the nested array.

What do you feel is most improved in your refactored solution?  

  I definitely improved the display method to provide the same functionality with less code,
  by introducing some interation to the displayed lines. After refactoring, I also added some
  additional code to generate a legal bingo board. I've also added a victory method to check
  for certain configurations of "X" squares. Finally, I added a force method which allows
  you to bypass the random number generator, which is invaluable for testing.
  
=end