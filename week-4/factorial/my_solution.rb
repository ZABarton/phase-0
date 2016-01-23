
# Factorial

# I worked on this challenge [with: Spencer Alexander].


# Your Solution Below

def factorial(number)
	result = 1
	while number > 0
		result *= number
		number -= 1
	end
	return result
end

