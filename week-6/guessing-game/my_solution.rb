# Build a simple guessing game


# I worked on this challenge [by myself].
# I spent [#] hours on this challenge.

# Pseudocode

# Input: pass an integer to the initialize method
# Output: The initialize method returns an integer that the user has to guess
# Steps:
# Define the initialize method
#   Pass an integer to the initialize method
#   Generate a random number between 1 and the integer
#   Assign that number to a class variable
#
# Define the guess method
#   Pass an integer to the guess method
#   If the guess is lower than the answer, return the low symbol
#   If the guess is higher, then return the high symbol
#   Else if the guess is equal, return the correct symbol
#
# Define the solved? method
#   Pass a symbol as an argument
#   If symbol is the correct symbol, return true
#   Otherwise, return false

# Initial Solution

# class GuessingGame
#   def initialize(answer)
#     @answer = rand(1..answer)
#   	puts "I'm thinking of a number between 1 and #{answer}"
#   	puts "The only winning move is not to play...er, start guessing."
#   end

#   def guess(input)
#   	if input < @answer
#   		puts "Your guess is too low."
#   		result = :low
#   	elsif input > @answer
#   		puts "Your guess is too high."
#   		result = :high
#   	else
#   		puts "Your guess is correct!"
#   		result = :correct
#   	end
#   	solved?(result)
#   end

#   def solved?(symbol)
#   	unless symbol == :correct
#   		puts "Guess again!"
#   		return false
#   	end
#   	puts "Ok, you can stop guessing now."
#   	return true
#   end

# end




# Refactored Solution

=begin
Okay, a few problems here:

First off, this code works if you actually go into IRB and play the game.
So the issue is more of refactoring to pass the tests, rather than
reworking the function/intention of the code.

As for the errors:
- The guess method does not actually return :high, :low, or :correct
  Instead, it passes that symbol to the solved? method within its own
  method and then returns the result (true or false). We need to rewrite
  our if statement to return the symbols instead.	
- We might have a problem with the random number generator if the
  tests are expecting the initialize method to generate a specific answer.
  We'll keep an eye on that.
- We'll also need to rewrite the solved? method to meet the requirements
  in the problem statement. This means that we will need to pass the solved?
  method the result from our last guess and return true or false if the last
  guess was correct or not.

=end

class GuessingGame
  def initialize(answer)
    @answer = answer
  end

  def guess(input)
    @input = input
  	if @input < @answer
  		puts "Your guess is too low."
  		return :low
  	elsif @input > @answer
  		puts "Your guess is too high."
  		return :high
  	else
  		puts "Your guess is correct!"
  		return :correct
  	end
  end

  def solved?()
    if @input == @answer
      return true
    else
      return false
    end
  end

end

# Reflection

# How do instance variables and methods represent the characteristics 
# and behaviors (actions) of a real-world object?

# - Instance variables and methods are always created specifically for
#   the class they are created in. If you were creating a real world object,
#   the class would be the blueprint used to create multiple objects,
#   such as building many houses from the same set of plans. Methods would
#   represent the behavior of these objects, such as defining the calculations
#   to determine how much building material is needed to create each house. The
#   instance variables can be used to record information about each object, such
#   as the number of rooms, or the address of each house.

# When should you use instance variables? What do they do for you?

# - Instance variables should be used within a class method to provide a variable
#   accessible anywhere within the scope of the class method. This means that you
#   can define an instance variable within one part of the class method and call it
#   later within a private method in that class. This allows you to pass information
#   into a private method even if it takes no arguments, such as the solved? method
#   in this example.

# Explain how to use flow control. Did you have any trouble using it in this challenge? If so, what did you struggle with?

# - I had a little trouble with the flow control in the solved? method. I thought that
#   I could simply the if statement with an unless statement, but either I got the logic backwards
#   or it wasn't performing as expected to pass the test. I think that the if statement is
#   required because the test is expecting solved? to be re-evaluated after each guess.

# - Why do you think this code requires you to return symbols? What are the benefits of using symbols?

# Each symbol is a unique objectid and there cannot be mulitple copies of it. Compare this to a string,
# where each new string, even if the contents are exactly the same, is a new object ID. Over iterations of
# millions of guesses, the amount of new strings generated could take up a significant amount of memory.
# Using symbols, only three symbols are needed regardless of how many guess methods are called.

