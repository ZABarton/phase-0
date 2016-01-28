# Numbers to Commas Solo Challenge

# I spent [] hours on this challenge.

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# 0. Pseudocode

# What is the input? 
# A positive integer

# What is the output? (i.e. What should the code return?)
# A string containing the original integer with commas included

# What are the steps needed to solve the problem?

=begin
Define a method that takes a single argument - an integer
Convert that integer to a string
Apply the length method to calculate the length of the string

Determine comma placement:
	Reading from right to left, commas should be inserted after every third character in the string
	BUT only if the comma is followed by another character
	In terms of strings, start at the highest index, move three indexes down, insert a comma
	A comma should never be inserted into index 0

	Since strings can be any length, it might be easier to reverse the string to work from index 0 up, 
	until you run out of length. A comma then would never be inserted as the final index. 
	Then, re-reverse the string before returning.
	
Inserting commas:
	Using the reversal method, we need to start at index zero and break the
	string into several substrings at every third character. If the substring
	has a length of three, add a comma to the end of it. If the substring is
	shorter than three, you've reached the end of the string and do not add a
	comma.

	Add all of the substrings, now including commas, in the order they were created. back together.

Reverse the result.
Return the resulting string.

=end

# 1. Initial Solution

# def separate_comma(number)
# 	number = number.to_s.reverse!
# 	i = 0
# 	new_number = ""
# 	while i < number.length
# 		if number[i..(i+3)].length == 4
# 			new_number = new_number + number[i..(i+2)] + ","
# 		else
# 			new_number = new_number + number[i..(i+2)]
# 		end
# 		i += 3
# 	end
# 	return new_number.reverse!
# end	

# p separate_comma(9876543210)

# 2. Refactored Solution

# The insert method for strings can insert a substring at a given
# index. We can also supply a negative index to start at the end of
# the string, eliminating the need for the reverse method.

# We want to work from left to right when using the insert method, because
# if we are continually inserting characters into the string and making it
# longer, working from the end of the string will be inconsistent.

def separate_comma(number)
	number = number.to_s
	start_index = number.length % 3
	if start_index == 0
		start_index = 3 
	end
	while start_index < number.length
		number = number.insert(start_index, ',')
		start_index += 4
	end
	return number
end

# 3. Reflection

=begin
	
- What was your process for breaking the problem down? What different approaches did you consider?

In my pseudocode, I just started writing what I thought would be a potential solution. In the process
of writing down the plan, it helped me visualize upcoming problems with that plan if I were to
implement it, which allowed me to change the direction of my pseudocode on the fly. For example,
my initial thought was to work from the string from right to left (backwards) because the commas
were constantly spaced in that direction. However, implementing that solution for any length of
array would be very challenging, but including the reverse method would accomplish the same solution
working from left to right instead.

- Was your pseudocode effective in helping you build a successful initial solution?

Definitely! After spending a thorough effort on building the pseudocode, it was just a matter of
translating the English words into code. I wrote the pseudocode in general enough terms that the
code did not rely on any specific methods - instead, it could be achieved with admittedly complex
iteration loops.

- What new Ruby method(s) did you use when refactoring your solution? Describe your experience 
  of using the Ruby documentation to implement it/them (any difficulties, etc.). 
  Did it/they significantly change the way your code works? If so, how?

The first thing I did was search the "string" page for the word insert - luckily, that immediately
turned up the insert method. I've found that the best way to search through the docs so far is to
navigate to the page corresponding to what you are working with, and then search for a word that relates
to what you want to do. So, looking for a way to insert characters into a string yielded the insert
method, which does exactly that. This simplified the code by quite a bit - rather than breaking the
string into substrings, adding commas where appropriate, and adding them back together, we could
iterate through the string and add commas directly to the string. We also skipped two methods to
reverse the code, then re-reverse it to its original state.

- How did you initially iterate through the data structure?

Once I had the string passed into the method and reversed it, the iteration checked to see
if a substring of the first three indexes returned a length of 4. If so, we could add a comma
into that substringe, because we knew another digit would follow the comma. Then we just kept
running that loop until we reached a point where the last three indexes returned a length less
than 4 - this means we were at the end of the string (or the beginning of our original input.)
At that point, we do not append a comma to that substring because no more numbers follow.

- Do you feel your refactored solution is more readable than your initial solution? Why?

It's much more readable. By taking less steps, the program is pretty readable and removes some
abstract concepts. You don't need to worry about why the program calls the reverse method twice.
The variables are better named to describe their function - start_index obviously refers to the
index where we start inserting commas. And the insert method, while faster, is also a great
semantic pointer for someone reading the code. Clearly, we are inserting characters into this
string.

=end