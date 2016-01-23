# Analyze the Errors

# I worked on this challenge by myself.
# I spent [#] hours on this challenge.

# --- error -------------------------------------------------------

cartmans_phrase = "Screw you guys " + "I'm going home."

# This error was analyzed in the README file.

# --- error -------------------------------------------------------

def cartman_hates(thing)
  while true
    puts "What's there to hate about #{thing}?"
	end
end

# This is a tricky error. The line number may throw you off.

# 1. What is the name of the file with the error?
#    errors.rb
# 2. What is the line number where the error occurs?
#    The error occurs in line 171
# 3. What is the type of error message?
#    This is a syntax error
# 4. What additional information does the interpreter provide about this type of error?
#    Ruby was looking for the keyword end, but could not find it in the code.
# 5. Where is the error in the code?
# 	 The error occurs at the very end of the code, since it searched the entire program for the missing end statement and could not find it.
# 6. Why did the interpreter give you this error?
#    This error occurred because the while loop is missing its own end keyword.
#    Therefore the end keyword meant to close the method is applied to the while loop instead.
#    This means the entire rest of the program is considered to be part of the cartman_hates method.
#    At the end of the code, Ruby was expecting an end keyword to close the method but it isn't there.
# 	 This could be fixed by adding an end keyword between lines 16 and 17.

# --- error -------------------------------------------------------

south_park = "It's ok"

# 1. What is the line number where the error occurs?
#    Line 41
# 2. What is the type of error message?
#    Undefined local variable or method
# 3. What additional information does the interpreter provide about this type of error?
#    It tells you the name of the undefined variable.
# 4. Where is the error in the code?
#    The error message doesn't specify, but does point to a specific undefined variable on line 41.
# 5. Why did the interpreter give you this error?
#    We can't call a local variable without assigining it a value first.
#    We would need to declare the value when introducing the variable.

# --- error -------------------------------------------------------

def cartman()
end

# 1. What is the line number where the error occurs?
#    Line 57
# 2. What is the type of error message?
#    Undefined method
# 3. What additional information does the interpreter provide about this type of error?
#    The undefined method is named cartman.
# 4. Where is the error in the code?
#    Doesn't specify, but indicates the name of the undefined method and the line it appears.
# 5. Why did the interpreter give you this error?
#    We are calling a method that has not been previously defined in the program.
#    This statement is saying "use the method cartman with no argument", but we haven't actually defined cartman yet.
#    We can fix this by defining the method first.

# --- error -------------------------------------------------------

def cartmans_phrase(words)
  puts "I'm not fat; I'm big-boned!"
end

cartmans_phrase('I hate Kyle')

# 1. What is the line number where the error occurs?
#    Line 75
# 2. What is the type of error message?
#    Wrong number of arguments
# 3. What additional information does the interpreter provide about this type of error?
#    It says that we tried to pass the method one argument but the method only takes zero arguments
# 4. Where is the error in the code?
#    The error actually occurs on line 79, where we try to call the method with an argument when it isn't defined to take one.
# 5. Why did the interpreter give you this error?
#    cartmans_phrase does not take arguments. This error occurs because we tried to pass an argument
#    into the method. Ruby does not know what to do with that argument.
#    We can fix this by appending line 75 with a local variable to take as an argument.

# --- error -------------------------------------------------------

def cartman_says(offensive_message)
  puts offensive_message
end

cartman_says("Screw you, hippie!")

# 1. What is the line number where the error occurs?
#    Line 96
# 2. What is the type of error message?
#    Wrong number of arguments
# 3. What additional information does the interpreter provide about this type of error?
#    We tried to pass the method zero arguments but it was expecting one argument instead.
# 4. Where is the error in the code?
#    Ther error occurs on line 100 when we try to call the method without passing an argument.
# 5. Why did the interpreter give you this error?
#    The method needs to have one argument passed to it. Calling the method without passing the
#    argument prevents the method from running. We can fix this by appending an
#    argument to line 100.



# --- error -------------------------------------------------------

def cartmans_lie(lie, name)
  puts "#{lie}, #{name}!"
end

cartmans_lie('A meteor the size of the earth is about to hit Wyoming!', 'Kenny')

# 1. What is the line number where the error occurs?
#    Line 119
# 2. What is the type of error message?
#    Wrong number of arguments
# 3. What additional information does the interpreter provide about this type of error?
#    We tried to pass the method one argument but it was expecting two.
# 4. Where is the error in the code?
#    The error occurs on line 123, where we call the method with the incorrect number of arguments.
# 5. Why did the interpreter give you this error?
#    Again, we called the method using a different number of arguments than what Ruby
#    expected. We can fix this by adding a second argument in line 123.

# --- error -------------------------------------------------------

"Respect my authoritay!" * 5

# 1. What is the line number where the error occurs?
#    Line 139 
# 2. What is the type of error message?
#    This is a type error - meaning we tried to do something type-specific to a variable of the wrong type.
# 3. What additional information does the interpreter provide about this type of error?
#    The error concerns a string that needed to be converted to a number.
# 4. Where is the error in the code?
#    The error occurs right after the multiplication operator. It was looking for a number after the operator, but found a string.
# 5. Why did the interpreter give you this error?
#    We can multiply strings by numbers, but not vice versa. We can fix this
#    by reversing the order of the equation.

# --- error -------------------------------------------------------

amount_of_kfc_left = 20/2


# 1. What is the line number where the error occurs?
#    Line 155
# 2. What is the type of error message?
#    ZeroDivisionError - you can't divide by 0
# 3. What additional information does the interpreter provide about this type of error?
#    We tried to divide a number by zero in line 155
# 4. Where is the error in the code?
#    Immediately after the divisor operator
# 5. Why did the interpreter give you this error?
#    It's a mathematical rule that you cannot divide a number by 0. Ruby
#    does not know how to handle that because there isn't a way to calculate
#    this equation. We can fix this by changing the 0 to any other number.

# --- error -------------------------------------------------------

require_relative "cartmans_essay.rb"

# 1. What is the line number where the error occurs?
#    Line 173
# 2. What is the type of error message?
#    Load Error - Ruby wants to load a file but can't find it.
# 3. What additional information does the interpreter provide about this type of error?
#    Specifies the path where Ruby is searching for the missing file. 
# 4. Where is the error in the code?
#    The error occurs at the keyword require_relative.
# 5. Why did the interpreter give you this error?
#    There are two issues here. First, the file doesn't exist. So we would need to
#    create a cartmans_essay.md file in the same directory as this code. But, we also
#    need to make the relative file a ruby specific file as well. So we can fix this by
#    changing the filename in line 173 to a .rb extension, as well as the filename of
#    the file we just created.

# --- REFLECTION ------------------------------------------------------
# Write your reflection below as a comment.
=begin
	
Which error was the most difficult to read?

I thought the load error was the most difficult one to read. There was a second issue
with the error that wasn't explicitly mentioned in the error message. It took a little
experimentation to find the right answer.

How did you figure out what the issue with the error was?

Trial and error, mostly. When creating a *.md file didn't change the error message,
I realized the problem was with the actual file type.

Were you able to determine why each error message happened based on the code?

Yes! Since I did this challenge near the end of the week, a lot of the errors were pretty
self-evident since we've been working with these concepts for a while now.
I can understand how reading error messages will become invaluable once we start working
with much larger code bases.

When you encounter errors in your future code, what process will you follow to help you debug?

One part of the process will be to do research on unknown types of errors. I can guarantee
that I'm not the first person to find that particular error and there should
be plenty of resources available online to learn more about what's happening. Otherwise,
I think the best way to handle errors are to deal with them one at a time and try to isolate
the problem area as best as you can. Once you've resolved one, you can then move on to the next.
=end