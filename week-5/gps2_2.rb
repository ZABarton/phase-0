# PSEUDOCODE

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # define the method
  # create a new hash - groceries = {}
  # split string to create separate words that can be turned into keys
  # set default quantity = 1
  # defaultQuantity = 1 ?

  # groceries {
  #	arg1: defaultQuantity,
  #	}

  # print the list to the console [can you use one of your other methods here?]
  # return the hash
# output: hash

# Method to add an item to a list
# input: item name and optional quantity (key value pair)
# steps:
# 	call the hash returned from the first method
#   add arg1 as key, add arg2 as value
#   return the hash 	
# output: hash with new key value pair

# Method to remove an item from the list
# input: item name
# steps:
# => call the hash
# => remove arg1 as key
# => return the hash
# output: hash with key value pair removed

# Method to update the quantity of an item
# input: item name, updated quantity
# steps:
# => call the hash
# => pass arg2 as a new value for the arg1 key
# => return the hash
# output: hash with updated value for existing key

# Method to print a list and make it look pretty
# input: hash
# steps: 
# => puts a key-value pair on a single line
# => #{key}.........{#value}
# => some string of dots "........................"
# => subtract key.length from dots.length to format key-value pair
# => iterate through hash to puts all key-value pairs
# output: list of text

def create_list(items)
	array = items.split
	defaultQuantity = 1
	groceries = {}
	array.each do |food|
		groceries[food] = defaultQuantity
	end
	return groceries
end

list = create_list("carrots apples cereal pizza")

def add_item(item, list)
	defaultQuantity = 1
	list[item] = defaultQuantity
	return list
end

def remove_item(item, list)
	list.delete(item)
	return list
end

def update_item(item, qty, list)
	list[item] = qty
	return list
end

def pretty_list(list)
	dots = "................."
	list.each do |item, quantity|
		x = item.length
		puts item + dots[x..16] + quantity.to_s
	end
end

test_list = create_list("lemonade tomatoes onions ice_cream")
puts test_list
remove_item("lemonade", test_list)
puts test_list
update_item("tomatoes", 3, test_list)
update_item("ice_cream", 4, test_list)
pretty_list(test_list)

=begin
REFACTORING OPTIONS

Define the hash outside of the method and use the method to fill it in.

groceries = {}

def create_list(items, list)
	array = items.split
	array.each do |food|
		list[food] = 1
	end
	return list
end

syntax: create_list("lemonade tomatoes onions ice_cream")

Specify quantity when adding a new item to the list

def add_item(item, qty, list)
	list[item] = qty
	return list
end

syntax: add_item("cheese", 100, groceries)

Other options to improve upon, but not within the scope of this challenge:

- Adding an if/else flow structure to the add_item method to disallow duplicate items
- Adding an if/else flow structure to the remove_item method in case user enters an item not on the list
- Adding an if/else flow structure to the update_item method if the item cannot be found or if the number is less than 0
- Devising a new way to split the text to allow items with two or more words (such as use commas to separate the string)	

REFLECTIONS

- What did you learn about pseudocode from working on this challenge?

Pseudocode is INCREDIBLY helpful. Before this challenge, I haven't seen the need for it myself because the programs
haven't been all that complex. But working through some of these problems ended up being so much easier because
we took the time to write out a plan first. I need to work on not translating my English thoughts straight into code
right away.

- What are the tradeoffs of using Arrays and Hashes for this challenge?

Hashes are slightly more complicated than arrays but are very useful for assigning specific names for indexed values.
Letting the user access a value by a name index rather than a numerical one is much easier to understand.
In a case like this, storing a key value pair is much easier to maintain than two parallel arrays, one for items and
the other for quantity. 

- What does a method return?

A method returns a value - by default, the last value generated in the method. The return keyword can be used to return
a specific value from the method. Methods can contain more than one return keyword, which is useful for control flow.

- What kind of things can you pass into methods as arguments?

Methods can take any number of objects as arguments - integers, floats, strings, and even hashes and arrays.

- How can you pass information between methods?

If your method is returning out a local variable, you will need to assign the result of your method to a variable outside
of the scope of your method. For instance, if your method looks like this:

	def number_plus_three(num)
		total = num + 3
		return total
	end

then referencing the variable number outside of the method will throw a variable error. Instead, you would need to define
the outside variable like so:

	myNumber = number_is_three(4)
	puts myNumber
	# should display 7
	
- What concepts were solidified in this challenge, and what concepts are still confusing?

This was good practice in working with hashes. We learned some new methods, such as hash.delete and string.split. We also
went out of our way to figure out how to return a fixed column spacing for our grocery list so that the items were
justified left and numbers justified right. We learned a lot about how local variables worked and how to successfully get those
values out of the methods to be used later on. I thought that this exercise went really well, and showed that I had a decent
grasp of the concepts from last week.

=end