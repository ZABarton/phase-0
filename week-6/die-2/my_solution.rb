# Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself].
# I spent [#] hours on this challenge.

# Pseudocode

# Input: 
# An array of strings to represent different faces of the die
# Output: 
# The sides method, which tells the user the number of sides on the die
# The roll method, which randomly returns a string from the initial array
# Steps:
# Define the initialize method:
#   Accept an array of strings as an argument
#       Raise an argument error if string is empty (or only contains 1 element)
#       Raise an argument error is input is not an array
#   Set an instance variable equal to the array passed into the initialize method
# Define the sides method:
#   No arguments required
#   Determine the length of the instance variable
#   Return that length as an integer
# Define the roll method:
#   Generate a random number between 0 and the length of the array
#   Return the object corresponding to that index


# Initial Solution

# class Die
#   def initialize(labels)
#   	unless labels.is_a?(Array)
#   		raise.ArgumentError.new ("Input must be an array!")
#   	end
#   	unless labels.length > 1
#   		raise.ArgumentError.new ("This die requires more than one label!")
#   	end
#   	@labels = labels
#   end

#   def sides
#   	sides = @labels.length
#   	return sides
#   end


#   def roll
#   	face = rand(0..@labels.length)
#   	return @labels[face]
#   end
# end



# Refactored Solution

# A couple of issues here:
# First:  the spec file explicitly allows for a die of 1 face, despite this being
#         physically impossible. We can change that argument error.
# Second: Our syntax for argument errors is broken. There is no period
#         between raise and ArgumentError.new
# Third:  Our random number statement for the roll method is incorrect.
#         If our array has length 5, we can generate an index between 0 and 5
#         BUT we only have indexes 0..4 in that array. So we need to adjust the
#         result to provide valid indexes.

class Die
  def initialize(labels)
  	unless labels.is_a?(Array)
  		raise ArgumentError.new ("Input must be an array!")
  	end
  	if labels == []
  		raise ArgumentError.new ("This die requires more than one label!")
  	end
  	@labels = labels
  end

  def sides
  	sides = @labels.length
  	return sides
  end


  def roll
  	face = rand(1..@labels.length) - 1
  	return @labels[face]
  end
end

# Reflection

# - What were the main differences between this die class and the last one you created in terms of implementation? 
#   Did you need to change much logic to get this to work?
#
#   In terms of implementation, most of this class was similar in form and function to the previous class we wrote.
#   The initialize, sides, and roll method worked in the same fashion but only had to be modified slightly to handle
#
# - What does this exercise teach you about making code that is easily changeable or modifiable? 
#
#   This is a really good practice! This second class didn't require much work at all to modify it from the first.
#   For practice, this exercise was typed up by hand, but we really could have just copied and pasted the original
#   die class and changed the arguments to handle arrays rather than integers.
#
# - What new methods did you learn when working on this challenge, if any?
#   No new methods, unfortunately. However, I did get some practice with modifying the output of the rand() method.
#   
# - What concepts about classes were you able to solidify in this challenge?
#
#   It's a good reminder of how instance variables work. We want to make sure that @labels variable is always assigned to the
#   labels variable passed in the initialize method. This allows our other instance methods to work as intended. 