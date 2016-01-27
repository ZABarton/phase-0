# Pad an Array

# I worked on this challenge with Ryan

# I spent [] hours on this challenge.


# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.



# 0. Pseudocode

# What is the input? We will pass in an array, the minimum size of the array, and an optional default value for padding.
# What is the output? (i.e. What should the code return?) New array equal to the original if minimum size is already met.
# => New array with padded values up to the minimum size if minimum size is not met. Padding values set to nil unless optional default argument is supplied.
# What are the steps needed to solve the problem?

# Define a method that accepts three arguments - an array, an integer, and an optional value with default set to nil.
# Set variable to store length of original array passed in
# Set up flow structure:
# => if the minimum size is equal to or less than the length of the array, do nothing
# => otherwise find the difference between minimum size and array, and add that number of padding values to the end of the array
# => return statement differs if destructive or not:
# => return the argument array if destructive, regardless if changed or not
# => return the local array if non destructive, regardless if changed or not

=begin
# 1. Initial Solution
def pad!(array, min_size, value = nil) #destructive
	if min_size <= array.length
		return array
	else
		needed_pads = min_size - array.length
		needed_pads.times do
			array << value
		end
	end
	return array
end

def pad(array, min_size, value = nil) #non-destructive
	new_array = array.dup
	if min_size <= array.length
		return new_array
	else
		needed_pads = min_size - array.length
		needed_pads.times do
			new_array << value
		end
	end
	return new_array
end
=end

# 3. Refactored Solution

=begin
def pad!(array, min_size, value = nil) #destructive
	return array if min_size <= array.length
	needed_pads = min_size - array.length
	needed_pads.times do
		array << value
	end
	return array
end

def pad(array, min_size, value = nil) #non-destructive
	new_array = array.dup
	return new_array if min_size <= array.length
	needed_pads = min_size - array.length
	needed_pads.times do
		new_array << value
	end
	return new_array
end

=end
def pad!(array, min_size, value = nil)
	return array if min_size <= array.length
	needed_pads = min_size - array.length
	padding = Array.new(needed_pads, value)
	padding.each { |item| array << item }
	return array
end

def pad(array, min_size, value = nil)
	return array.dup if min_size <= array.length
	needed_pads = min_size - array.length
	padding = Array.new(needed_pads, value)
	return array + padding
end

p pad!([1, 2, 3], 10, "apple")
p pad([1, 2, 3], 10, "banana")

# 4. Reflection

# - Were you successful in breaking the problem down into small steps?

# Yeah! I had previously finished GPS 2.2 in this week already, and during
# that exercise our good pseudocode made that exercise so much smoother. It
# seems that a few moments really focused on good pseudocode in the beginning
# of the project translates into a lot of time saved when it comes to actually
# writing the real code. We made sure to make our pseudocode as plain and easy 
# to follow as possible.

# - Once you had written your pseudocode, were you able to easily translate it into code? 
#   What difficulties and successes did you have?

# For the most part, everything was in order and we didn't have too much trouble
# translating the pseudocode into real code. There were a few steps that we didn't
# break down as much as we would have liked - for example, we knew that we needed
# to add some number of padding values to the end of the array but at the time,
# we didn't know enough about object IDs to know if there were going to be any issues.

# - Was your initial solution successful at passing the tests? If so, why do you think that is? 
#   If not, what were the errors you encountered and what did you do to resolve them?

# The biggest obstacle we ran into was regarding object IDs. We quickly learned that declaring
# a new variable and assigning it a value of another variable retains the object ID of the
# original variable. Even though we return a variable with a different name than the original,
# because they both have the same object ID, the method is still considered destructive. To solve
# this, my pair and I researched the .dup method, which duplicates an object but assigns a new
# object ID to it as well. Another issue we had was with our math - we reversed the order of two
# numbers in our subtraction operation, which caused us to fail. Once we ran it through Rspec, we
# figured out the error and fixed it quickly.

# - When you refactored, did you find any existing methods in Ruby to clean up your code?

# We didn't really use any new methods, aside from the .dup method described earlier.
# Instead, when we refactored, our initial code resulted in the opposite result for each
# method - for instance, our destructive method was actually non-destructive, and vice versa.
# From this, we learned the difference between adding two arrays together versus pushing an
# array to append to an existing one. In the first case, adding two arrays together, regardless
# of the variable name you assign the result to, creates a new object ID that is distinct from
# the first two altogether - meaning your result is non-destructive. Appending an array to an
# existing one retains the object ID from the original array.

# - How readable is your solution? Did you and your pair choose descriptive variable names?

# I feel pretty good about both our refactored and original solution. All of the variable names
# are fairly clear and convey an understanding about their purpose. We re-wrote the conditional
# statements to read more like English - such as return _____ if _______. The methods as
# suffixes to the variables also make the code more readable. It's pretty clear what .times means.

# - What is the difference between destructive and non-destructive methods in your own words?

# A destructive method permanently alters the argument(s) passed into it. If you had a variable
# defined outside of the method, and passed it to the method as an argument, calling the variable
# after the method would provide a different answer than if you had called it before. Non-destructive
# methods are the opposite - regardless of the function of the method, the original variables used as
# arguments will retain their original properties.