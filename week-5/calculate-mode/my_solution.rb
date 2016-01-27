# Calculate the mode Pairing Challenge

# I worked on this challenge [with Zach Barton]

# I spent [] hours on this challenge.

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented.



# 0. Pseudocode

# What is the input? A single array of objects
# What is the output? (i.e. What should the code return?) An array that lists the most frequent value(s) in the original array passed in
# What are the steps needed to solve the problem?
# Define a method taking an array of objects as an argument
# Define an empty hash
# Iterate through the argument array
# 	If the hash doesn't contain a key that is equal to the current argument-arry object, add it as a new key
# 	Assign that key a default value of 1
# 	If the key already exists, increase its value by 1 (keeping count of frequency)
# Define an empty array to hold the highest-frequency keys
# Sort the hash by the values of the key-value pairs
# Reverse the sorted hash so that the "winner" is first
# Add this first key to the "winner" array 
# Test if other key-value pairs have the same value (frequency) as the winner
# 	If it has the same value:
# 		Push it into the winner array 
# 	Else
# 		Do nothing
# Return the winner array


# 1. Initial Solution

# def mode (arr)
# 	frequencies = {}
# 	arr.each do |obj|
# 		if frequencies[obj]
# 			frequencies[obj] += 1
# 		else
# 			frequencies[obj] = 1
# 		end
# 	end
# 	winners = []
# 	highest_frequency = 1
# 	frequencies.each do |item, freq|
# 		if freq > highest_frequency
# 			highest_frequency = freq
# 		end
# 	end
# 	frequencies.each do |item, freq|
# 		if freq == highest_frequency
# 			winners << item
# 		end
# 	end
# 	return winners
# end

# my_arr = [1, 2, 3, 3, 3, 2, 0, 'taco', 'taco', 'taco']
# p mode(my_arr)

# 3. Refactored Solution

def mode (arr)
	frequencies = {}
	arr.each do |obj|
		frequencies[obj] = arr.count(obj)
	end
	modes = []
	highest_frequency = frequencies.max_by {|k, v| v}[1] # max_by returns [key, value] array
	frequencies.each do |item, freq|
		modes << item if freq == highest_frequency
	end

	# OR THIS:
	# modes = frequencies.collect {|k, v| k if v == highest_frequency}.select {|i| i != nil}
	# (Omitted due to unreadability)

	return modes
end

 # my_arr = [1, 2, 3, 3, 3, 2, 0, 'taco', 'taco', 'taco']
 # p mode(my_arr)

# 4. Reflection
=begin
	
- Which data structure did you and your pair decide to implement and why?

We decided to implement a hash for this assignment. We thought that it would be easier to create
a frequency histogram in the form of key-value pairs, where the key is the object and the value
is the number of times it is found in the argument array. This is feasible because each object in
the histogram is, by definition, unique.

- Were you more successful breaking this problem down into implementable pseudocode than the last with a pair? 

I thought that the pseduocode in this exercise went into more detail than the last one, but that
is mostly a function of getting more practice. We took the time to call out each individual step,
even if it was really tempting to just shortcut the process and jump straight into coding.

- What issues/successes did you run into when translating your pseudocode to code?

Our pseudocode worked just fine for providing an initial solution, but we realized as we were typing
it out that our pseudocode gave us a fairly inefficient process. We did a good job of sticking to the
plan, even if we were already developing ideas to refactor the code later at the same time. It was
important to get a working solution FIRST, and then refactor AFTER, not during.

- What methods did you use to iterate through the content? Did you find any good ones when you were refactoring? Were they difficult to implement?

We learned about SO MANY methods - this was great! We split our code into three major operations, defined by
the three .each method iterations we used. 

The first method was to iterate over an array to generate a hash of key-value pairs that signified object 
and frequency. We found the .count method would work just as well. The count method checks the entire array
for how many times a given object occurs. So when we iterated through the array, instead of maintaining
counter variables for each object, we could iterate the count method over each object and directly assign it to the hash.

The second iteration was a brute-force method to determine the highest frequency (value) in the hash.
To initially do this, we set the highest_frequency variable to the first value, and then iterated through the
hash to see if there were any larger ones. Whichever hash value was highest would be assigned to the
highest_frequency variable. This could be done with less code by implementing the .max_by method. What this
does is return the highest key-value pair out of the hash - but as a two-element array, which was
unexpected. To solve this, we accessed the second index of this two element array to specifically isolate 
the value. While we were proud of this solution, it did make the readibility a little worse, so we added
a comment to clarify this line of code.

Finally, the third iteration was to iterate over the hash once again and push any keys with a value that
matches the highest_frequency variable to the array that would eventually be returned. We had some initial
difficulty finding out new methods to do this, but settled on a combination of the .collect and .select
methods once we figured out the difference between the two. We used the collect method on our hash and
passed it a block which basically said "collect the key if the value matches the highest frequency." The
issue is that collect applies to every object in the hash, so if a key-value pair didn't match the
highest frequency, .collect would return nil instead. So we had to apply the .select method afterward to
"select" all values that were unequal to nil. While this worked in a single line of code, this lost a
lot of readibility and was very hard to follow. We ended up leaving our original solution in place during
the refactoring process, since it only results in two extra lines of code (one of which being an end
statement) and provides a lot more readibility for the user.

I can't emphasize enough how much of a great learning process this was. Knowing how these methods interact
with each other can only help us out in the future. I'm glad we spent all the time we did on refactoring
everything we could, even if it didn't make it into our final program.

 =end