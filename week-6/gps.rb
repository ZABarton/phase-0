# 1)Zach Barton
# 2)Michael Wang

def serving_size_calc(item_to_make, num_of_ingredients)
  library = {"cookie" => 1, "cake" =>  5, "pie" => 7}

  # check to see if item_to_make exists in library

  unless library.has_key?(item_to_make)
    raise ArgumentError.new("#{item_to_make} is not a valid input")
  end

  # calculate remainder of ingredients

  serving_size = library[item_to_make]
  remaining_ingredients = num_of_ingredients % serving_size
  
  # if a remainder exists, find the most efficient way to use
  # all remaining ingredients. Sort the hash by value to always
  # start with the item that takes the most ingredients to make 

  if remaining_ingredients != 0
    suggested_items = []
    remaining = remaining_ingredients
    library = library.sort_by { |food, ingredients| ingredients }
    library = library.reverse.to_h
    
    library.each do |food, ingredients|
      new_item = remaining_ingredients / ingredients
      suggested_items << [food, new_item]  
      remaining_ingredients = remaining_ingredients % ingredients
    end
    
    return "Calculations complete: Make #{num_of_ingredients / serving_size} of #{item_to_make}, you have #{remaining} leftover ingredients. Suggested baking items: #{suggested_items}"
  else  
    return "Calculations complete: Make #{num_of_ingredients / serving_size} of #{item_to_make}"
  end
end

p serving_size_calc("pie", 7)
p serving_size_calc("pie", 8)
p serving_size_calc("cake", 5)
p serving_size_calc("cake", 7)
p serving_size_calc("cookie", 1)
p serving_size_calc("cookie", 10)
p serving_size_calc("pie", 13)
#p serving_size_calc("THIS IS AN ERROR", 5)

=begin
REFLECTIONS

- What did you learn about making code readable by working on this challenge?

Well, we certainly learned that reading bad code is a terrible experience. Even though we knew what the
function of the program was supposed to do, deciphering some of the bad code took a lot of time
to figure out. We were about to get carried away on figuring out the logic behind some of the code,
but then we realized that we were going to rewrite the block anyway, so it really wasn't necessary
to understand the details of the bad code. We just had to figure out the intended function, and rewrite
the code to achieve the same result.

- Did you learn any new methods? What did you learn about them?

We learned how to sort a hash by values. To make the new feature work (what to do with the remaining
ingredients), we needed to write a way to put the largest values of the hash at the front, otherwise
we would always get all cookies and no cake as our result. To sort the hash, we converted the hash into
a nested array of key-value pairs sorted by age, in ascending order. Then, we could call the reverse method
on our array before converting it back into hash format.

Methods used:
.has_key(argument) - checks to see if the argument is equal to a key in the hash
.sort_by {code block} - sorts a hash by keys or values
.reverse - reverses the order of an indexed array
.to_h - converts an array to a hash

- What did you learn about accessing data in hashes?

We learned how to sort the hash by value, by specifically passing the value variable in our sort_by
code block. We also got some practice using both key and value variables in our code block, and working
with both of those within a do loop to achieve the desired result.

- What concepts were solidified when working through this challenge?

We worked on a little bit of everything! We got some practice refactoring right off the bat to make the code
readable. We also got to practice pseudocode when we were designing the new feature. Finally, we solidified
the concept of a Minimum Viable Product and applied some time-boxing to that. It is easy to get carried away
in your scope for adding new features, but we started small and used the remaining time to debug and/or
improve the code.
=end