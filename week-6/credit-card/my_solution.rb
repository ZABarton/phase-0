# Pseudocode

# Input: A 16 digit credit card number
# Output: True or false (depending on if credit card number is valid or not)
# Steps:
# 
# Define CC Class
#
# Define the initialize method:
#   Raise an argument error if CC# is not a 16 digit integer
# 	Take the argument passed into the init method and create a 16-element array
#   Explicitly convert integer to string for this split method
# 		Each element equals a single digit of the CC#
#   Create instance variable with the array   
# 
# Define a math method:
# 	Double the even indexes of our array (destructively)
# 	Iterate through the array to find and split two-digit numbers into one-digit numbers
#		Explicitly convert the even indexes to integers for the math, then put as strings for future use
# 	Split two digit STRINGS into two one-digit STRINGS and convert all to integers
#   Sum all elements of the array
#	Assign this sum to a new instance variable

# Define a check_card method:	
#  Take our sum instance variable modulo 10
#   If 0, true
#   If not zero, false

# Initial Solution

# Don't forget to check on initialization for a card length
# of exactly 16 digits

# class CreditCard
# 	def initialize(number)
# 		unless number.to_s.length == 16 && number.is_a?(Integer)
# 			raise ArgumentError.new("Credit Card number needs to be a 16-digit integer")
# 		end
# 		@number = number.to_s.split("")
# 	end

# 	def math
# 		evens = @number.select.each_with_index { |x,y| y.even? }
# 		odds = @number.select.each_with_index { |x,y| y.odd? }
# 		evens.map! { |x| x.to_i * 2 }		
# 		evens.map! { |x| x.to_s.split("")}
# 		@number = evens.flatten + odds
# 		@number.map! { |x| x.to_i }
# 		@sum = @number.inject { |total, object| total + object}
# 		puts @sum
# 	end

# 	def check_card
# 		math
# 		@sum % 10 == 0 ? (return true) : (return false)
# 	end
# end

# cardnumber = CreditCard.new(1203018346571839)
# cardnumber

# Refactored Solution

class CreditCard
	def initialize(number)
		unless number.to_s.length == 16 && number.is_a?(Integer)
			raise ArgumentError.new("Credit Card Number needs to be a 16-digit integer")
		end
		@number = number.to_s.split("")
	end

	def math
		split = @number.partition.each_with_index { |digit, index| index.even? }
		split[0].map! { |number| (number.to_i * 2).divmod(10) }
		split[1].map! { |number| number.to_i }
		@sum = split.flatten.inject {|total, digits| total + digits }
	end

	def check_card
		math
		@sum % 10 == 0 ? (return true) : (return false)
	end
end

=begin
REFLECTIONS

What was the most difficult part of this challenge for you and your pair?

	Honestly, I think the hardest part of this challenge was managing all the transfers of strings
	to integers and vice versa. We knew exactly what we wanted to do, and did a great job writing out
	the pseudocode, but our .to_s and .to_i methods didn't always work how we intended them to. It took
	some testing in IRB to figure out where the methods weren't working. However, we did learn a lot
	about debugging in IRB so it was a good experience!

What new methods did you find to help you when you refactored?

	This part of the challenge was great. We looked through the docs for anything that could help, and
	came up with some new methods that simplified our code greatly. The partition method was a fantastic way
	to separate the numbers we wanted to double from the numbers we wanted to leave alone. We used the
	partition method to catch all of the even indexed numbers in the initial credit card array, and put them
	in their own nested array. That way, we could map over that array while leaving the other digits alone.
	The other big discovery was the divmod solution. Divmod returns an array of two digits, the first being the
	quotient, and the second being the remainder. So if you have a two digit number and you apply the divmod(10)
	method, you will receive an array with the two digits separated into an array. This made our summation code
	easier because all we had to do was flatten the entire array and sum up all the numbers.

What concepts or learnings were you able to solidify in this challenge?

	One thing we got some practice with was learning the order of operations in calling methods in a chain.
	This gave us some issues applying the .to_s and .to_i methods. We were able to learn from this by writing
	the code in long-form first - one method per line. Then, we could refactor later by combining the methods into
	a single line. We also practiced testing the code in IRB by using the load command and running the driver code in
	IRB. This was very helpful for debugging because you can see exactly what is being returned and if it's what
	was expected. This helped us solve the inital problem faster because we could pinpoint the exact problems
	due to seeing the returned values of the methods.

=end

