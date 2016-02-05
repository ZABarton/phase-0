# RELEASE 2: NESTED STRUCTURE GOLF
# Hole 1
# Target element: "FORE"

array = [[1,2], ["inner", ["eagle", "par", ["FORE", "hook"]]]]

# attempts:
# ============================================================
p array[1][1][2][0]


# ============================================================

# Hole 2
# Target element: "congrats!"

hash = {outer: {inner: {"almost" => {3 => "congrats!"}}}}

# attempts:
# ============================================================
 p hash[:outer][:inner]["almost"][3]


# ============================================================


# Hole 3
# Target element: "finished"

nested_data = {array: ["array", {hash: "finished"}]}

# attempts:
# ============================================================

p nested_data[:array][1][:hash]

# ============================================================

# RELEASE 3: ITERATE OVER NESTED STRUCTURES

number_array = [5, [10, 15], [20,25,30], 35]

number_array.map! do |num| #num + 5
	if num.kind_of?(Array)
		num.map! {|num| num + 5}
	else num + 5
	end
end

p number_array

# Bonus:
startup_names = ["bit", ["find", "fast", ["optimize", "scope"]]]

# startup_names.map! do |string| 
# 	if string.kind_of?(Array)
# 		string.map! do |inner_string|
#  			if inner_string.kind_of?(Array)
#  				inner_string.map! {|inner_inner_string| inner_inner_string + "ly"}
#  			else string2 + "ly"
#  			end
#  		end
#  	else string + "ly"
#  	end
# end

# REFACTOR

def string_check(list)
	list.map! do |element|
		if element.kind_of?(Array)
			string_check(element)
		elsif element.kind_of?(String)
			element = element + "ly"
		end
	end
end

p string_check(startup_names)


=begin
What are some general rules you can apply to nested arrays?

	With nested arrays, accessing all of the data in every dimension of the array requires frequent iteration.
	An important thing to keep track of is what your placeholder stands for when accessing the array. Writing
	code to treat each type of element differently (sub-array vs string, for instance) will allow you to
	access all the data no matter how deep it is in the data structure.
  
What are some ways you can iterate over nested arrays?

	The simplest method is to write a series of nested interative loops equal to the highest level of nested
	arrays. For instance, if you have an array within an array, all within another array, you would need to
	create three nested loops to reach all of the arrays. The problem with this approach is that it is not easily
	scalable - what if the data structure included a fourth array? For larger data structures, the amount of
	code required is excessive.

Did you find any good new methods to implement or did you re-use one you were already familiar with? What was it and why did you decide that was a good option?

	During refactoring, we created our own method to interate over an array and add the "ly" string to each object within the array. If the method encountered
	a nested array, it would call itself and then check the nested array for other arrays. This solution allowed us to scale up to a data structure of any
	size. If there were any nested arrays, the method would repeat until no more nested arrays were found.

	This method also allowed us to get some practice with the map element in its destructive form. The original data structure was modified permanently
	to receive the "ly" suffix.
=end