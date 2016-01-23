# Add it up!

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# I worked on this challenge [by myself, with: Spencer Alexander].

# 0. total Pseudocode
# make sure all pseudocode is commented out!


# Input: array
# Output: result - the sum of all numbers in the array
# Steps to solve the problem.
# use each to go through the array and add the index to a running total

# 1. total initial solution

=begin
def total(array)
	result = 0
	array.each { |x| result += x }
	return result
end
=end

# 3. total refactored solution 

def total(array)
	result = 0
	array.each { |x| result += x }
	return result
end

# 4. sentence_maker pseudocode
# make sure all pseudocode is commented out!
# Input: array of strings
# Output: sentence containing all the strings in the array. Sentence starts with a capitalize and ends with a period.

# Steps to solve the problem.
# define result as an empty string
# use each to go through the array and add the string to result with a space between words
# capitalize method on the first index
# add a period after the last index

# 5. sentence_maker initial solution

=begin
def sentence_maker(array)
	result = ''
	array.each do |word|
		if word.index == 0
			result += word.capitalize
		elsif word.index == array.length
			result += " " + word + '.'
		else
			result += " " + word
		end
	end
	return result
end
=end		
			

# 6. sentence_maker refactored solution

def sentence_maker(array)
	result = ''
	array.each do |word|
		if array.index(word) == 0
			result += word.capitalize.to_s
		else
			result += " " + word.to_s
		end
	end
	result += "."
	return result
end