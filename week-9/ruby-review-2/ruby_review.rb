# I worked on this challenge by myself.
# This challenge took me [#] hours.


# Pseudocode

# Iterate over any given array
# 	Include each element and index
#   IF the result is divisible by 15
# 		THEN replace the index with "FizzBuzz"
# 	15 has to come first so it overrides 3 and 5
# 	ELSE IF the result is divisible by 3 or 5
# 		THEN replace with the appropriate string
# 	RETURN the modified array

# Initial Solution

# def super_fizzbuzz(array)
# 	array.each_with_index do |element, index|
# 		if element % 15 == 0
# 			array[index] = "FizzBuzz"
# 		elsif element % 3 == 0
# 			array[index] = "Fizz"
# 		elsif element % 5 == 0
# 			array[index] = "Buzz"
# 		end
# 	end
# 	return array
# end



# Refactored Solution

# same structure but instead of using the index, use the map method.

def super_fizzbuzz(array)
	array.map! do |element|
		if element % 15 == 0
			element = "FizzBuzz"
		elsif element % 3 == 0
			element = "Fizz"
		elsif element % 5 == 0
			element = "Buzz"
		else
			element = element
		end
	end
	return array
end

# Reflection

# This is a good refresher on how to iterate through arrays. This wasn't a difficult implementation of the FizzBuzz
# method, but it did allow some experimentation with different methods of iteration to achieve the same
# results.