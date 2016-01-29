# Die Class 1: Numeric

# I worked on this challenge by myself

# I spent [] hours on this challenge.

# 0. Pseudocode

# Input: A positive integer representing number of sides
# Output: Two class methods, sides and roll
# 		  Sides returns the number of sides we initially specified
#         Roll returns a random number between 1 and the number of sides
# Steps:
# 
# Set the initialize method
# 	Create a class variable to store number of sides
#   Set that equal to the number of sides specified
#   Before assigning the number to the class variable, check if argument is a positive integer
#   	If not, raise an argument error
#   End the method

# Set the sides method
# 	Return the number of sides specified in the initialize method
# 	End the method

# Set the roll method
# 	Generate a random number between 1 and the sides class variable.
#   Return that number
#   End the method

# 1. Initial Solution

# class Die
#   def initialize(sides)
#   	unless sides > 0 
#   		raise ArgumentError.new("Die must have a positive number of sides")
#   	end
#   	unless sides.is_a?(Integer)
#   		raise ArgumentError.new("Number of sides must be a whole number")
#   	end
#     @sides = sides
#   end

#   def sides
#     return @sides
#   end

#   def roll
#     result = rand(1..@sides)
#     return result
#   end
# end



# 3. Refactored Solution

# simplified argument error check

class Die
  def initialize(sides)
  	unless sides > 0 && sides.is_a?(Integer)
  		raise ArgumentError.new("Invalid number of sides - please provide a positive integer")
  	end
    @sides = sides
  end

  def sides
    return @sides
  end

  def roll
    result = rand(1..@sides)
    return result
  end
end

# 4. Reflection
=begin
	
- What is an ArgumentError and why would you use one?

An ArgumentError is a handy way to create specific guidelines for what arguments are accepted into a method.
You can use the ArgumentError to create a custom message to let the user what went wrong, and what
types of objects are acceptable. This way, you can prevent garbage inputs from entering your method in the
very beginning, allowing you to assume that your arguments are always the type you expect them to be.

- What new Ruby methods did you implement? What challenges and successes did you have in implementing them?

This was the first time I used the .is_a method, to check that the argument was actually an integer before
accepting it into the initialize method. It seemed pretty straightforward - one of the things I like best
about Ruby is that the method names are very semantic. Sides.is_a?(Integer) almost reads like a complete
English sentence. It's very clear what that does. I didn't go too deep into exploring the Random class.
It seemed like the rand method was exactly what we needed for this exercise.

- What is a Ruby class?

A Ruby class is a predefined length of code that can be used to generate new object and control that object's
behaviors. All objects are considered instances of a class - for example, all text strings belong to the class
"String". This allows for methods common to the String class to be applied to any particular string object.

- Why would you use a Ruby class?

A Ruby class allows you to write a chunk of code once, and then use that code to generate any number
of objects (instances). You can also define new class methods within the class to provide custom behavior 
specific to any instanced objects from that class.

- What is the difference between a local variable and an instance variable?

A local variable is defined within the scope of a method. Once the method is completed, the local variable
disappears and will be re-initialized when the method is called again. An instance variable is initialized
within a class, and is retained by the instance when it is generated. In this challenge, we set an instance
variable (@sides) to the number supplied as the initialize method argument. This instance variable is assigned
to that specific object. New objects generated may have different values of this instance variable, depending
on what value was supplied as the argument.

- Where can an instance variable be used?

Instance variables are used within a class definition. These are assigned to an object when the object
is defined.
	
=end