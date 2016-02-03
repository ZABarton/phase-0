#Attr Methods

# I worked on this challenge [by myself]

# I spent [#] hours on this challenge.

# Pseudocode

# Input: We input a string into the NameData method
# Output: The Greetings method will return a salutation using the class variable initialized in NameData
# Steps:

# Fill out the NameData class
# 	Define the initialization method
#   	Set a class variable equal to my name ("Zach Barton")
# Fill out the Greetings class
#   Define the initialization method
#       This method will create a class variable that is equal to the initialization method from the NameData class
#   Define the greeting method
#       This will print a greeting to the screen using the class variable from the NameData class as a string substitution.


class NameData
	def generate_name
		return "Zach"
	end
end


class Greetings
	def initialize
		@person = NameData.new
	end

	def hello
		puts "I'm sorry, #{@person.generate_name}. I'm afraid I can't do that."
	end
end

greet = Greetings.new
greet.hello

# Reflection

# RELEASE 1
#
# - What are these methods doing?
#   These methods are pretty similar to what we've created so far. We have two different types of methods here.
#   The first type of method is basically just telling you what the current value of the class variable is.
#   For instance, calling a "what_is_x" method simply returns the class variable x.
#   The second type of method allows you to change the class variable. These methods accept an argument, assign
#   it to an existing class variable, and return the new class variable.

# - How are they modifying or returning the value of instance variables?
#   The "what_is" methods return the class variable without any changes. The values specified in the initialize
#   method will be returned, depending on which method was called. These methods do not explicitly print anything
#   to the screen. The other methods allow you to change the class variable by assigning it to an argument
#   passed into the method. This is destructive - the class variable is permanently changed for this particular
#   object.

# RELEASE 2

# - What changed between the last release and this release?
#   This second release added a reader method for the age class variable.
# 
# - What was replaced?
#   The reader method for the class variable age allowed us to remove the what_is_age method.
#   This is because the reader method functions exactly the same with fewer lines of code.

# - Is this code simpler than the last?
#   Definitely! We have six different methods to display and/or change three different class variables. That's
#   a lot of excessive code. Using reader methods allows us to remove three long-form methods and replace them
#   with three lines of code, one for each method.

# RELEASE 3

# - What changed between the last release and this release?
#   We've added a writer method for the age class variable in addtion to the reader method from
#   the previous release.

# - What was replaced?
#   The addition of the writer method allows us to remove the method that allows us to change
#   the class variable. By calling the age method, we can now either display the class variable
#   or we can change it using the same method syntax. The only difference is that if we wanted to
#   change the class variable by using the writer method, we would call the method and set it
#   equal to the new value.

# - Is this code simpler than the last?
#   Definitely! Using reader and writer methods allows us to replace six methods with six lines of code.
#   Read and Write are semantic terms that clearly explain their function. We can now either read the value
#   of a class variable, or write a new value to that variable instead.

# RELEASE 4

# Added attr_accessor methods for each of the three class variables
# Removed the remaning methods
# Changed the names of the methods to refer to the accessors

# RELASE 5

# Same modifications as Release 4
# Combined accessors into a single line of code

# REFLECTIONS FOR MY SOLUTION

# - What is a reader method?
#   A reader method is a simplified way to include a built-in class method for
#   any instances generated within that class. The reader method allows you to
#   display values but does not allow you to modify them. A separate method must
#   be built to allow changes.

# - What is a writer method?
#   A writer method is very similar to a reader method, in that it provides a
#   built-in class method for instances generated from that class. Unlike the reader
#   method, however, the writer method allows you to change the value of a class
#   variable. By itself, the writer method will not display the new value.

# - What do the attr methods do for you?
#   The attr methods allow you to simplify your code by generating pre-built methods
#   by referring to a symbol. When an attr method is defined, it will either allow you
#   to display or change a value of a class variable by calling the symbol as the name
#   of your method. This prevents you from having to write multiple methods to change
#   each class variable in your class.

# - Should you always use an accessor to cover your bases? Why or why not?
#   Not always! Since the attr_accessor method allows the ability to both
#   read AND write to a class variable, this could allow for unintended consequences
#   if a class variable is overwritten with new data. To protect class variables that
#   should always remain constant, or that should change under very specific circumstances,
#   it is best to limit the attr methods to reader only.

# - What is confusing to you about these methods?
#   The attr methods seem to be pretty straight forward. Read and write pretty much do
#   exactly what their names suggest. My biggest hurdle in this exercise was figuring out
#   the syntax to share data created in an instance of one class inside of a second class.
#   The logic of writing a method without a specific initialize method took a little bit to
#   understand. I'm not 100% sure yet on how helpful this will be in the future but I look
#   forward to researching the importance of this for future exercises.