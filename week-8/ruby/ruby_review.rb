# I worked on this challenge [by myself].
# This challenge took me [#] hours.

# Pseudocode
# Input: a positive integer
# Output: true or false depending on whether the number is part of the Fibonacci sequence
# Steps:
# 	Brute force solution:
# 	Build a loop that starts at the first Fibonacci number (0) and loops through the sequence until
#   a number equal to or greater than the input number is reached.
# 		If the loop finds a match, the function returns true.
# 		If the loop skips the number and generates a higher number, the function returns false.

# Initial Solution

# def is_fibonacci?(num)
# 	previous_digit = 0
# 	current_digit = 1
# 	next_number = 0
# 	while next_number <= num 
# 		next_number = previous_digit + current_digit
# 		if next_number == num
# 			return true 
# 		end
# 		previous_digit = current_digit
# 		current_digit = next_number
# 	end
# 	return false		
# end



# Refactored Solution

# store data in single array instead of using multiple variables

def is_fibonacci?(num)
	fibonacci = [0,1]
	while fibonacci[-1] <= num
		next_number = fibonacci[-1] + fibonacci[-2]
		if next_number == num
			return true 
		end
		fibonacci << next_number
	end
	return false		
end





# Reflection

# What concepts did you review or learn in this challenge?

# This was mostly an exercise in getting back into the swing of Ruby syntax after
# working in JavaScript extensively this week and last. I got in the habit of
# adding semicolons to every line and brackets around every loop when starting this
# exercise. I forgot how much easier it is to write code in Ruby!

# What is still confusing to you about Ruby?

# So far, I'm feeling pretty confident in my Ruby skills. I think best practices for
# refactoring is something I could improve upon.

# What are you going to study to get more prepared for Phase 1?

# I'm going to continue to work through the extra Ruby challenges to make sure I'm well
# prepared for Phase 1. This will give me most of Week 9 to study further.
