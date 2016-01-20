# Leap Years

# I worked on this challenge [by myself, with: ].


# Your Solution Below
def leap_year?(year)
	if (year < 100 and year % 4 == 0)
		return true
	elsif (year < 400 and year % 100 == 0 and year % 4 == 0)
		return false
	elsif (year >= 400 and year % 400 == 0)
		return true
	else
		return false
	end
end
