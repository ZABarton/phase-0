#!/usr/bin/env ruby -Ku

# PSEUDOCODE

# Input: A single array of objects
# Output: A hash containing key-value pairs of group_name => array of objects
#         Each value array should have between 3 and 5 objects.
# Steps:
#
# Define a method that takes a single array argument
# 	Count the number of entries in that array
# 	Divide that number so that no group contains less than three objects
#   Assign the resulting number of objects into an array
#       BONUS: Assign the objects into these arrays at random
#   Create a hash that assigns group numbers as keys and these arrays as values
#   Return the hash 

students = ["Alivia Blount", "Alyssa Page", "Alyssa Ransbury", "Andria Reta", "Austin Dorff","Autumn McFeeley","Ayaz Uddin","Ben Giamarino","Benjamin Heidebrink","Bethelhem Assefa","Bobby Reith","Dana Breen","Brett Ripley","Rene Castillo","Justin J Chang","Ché Sanders","Chris Henderson","Chris Pon","Colette Pitamba","Connor Reaumond","Cyrus Vattes","Dan Heintzelman","David Lange","Eduardo Bueno","Liz Roche","Emmanuel Kaunitz","FJ","Frankie Pangilinan","Ian Fricker","Ian Thorp","Ivy Vetor","Jack Baginski","Jack Hamilton","JillianC","John Craigie","John Holman","John Maguire","John Pults","Jones Melton","Tyler Keating","Kenton Lin","Kevin Serrano","wolv","Kyle Rombach","Laura Montoya","Luis Ybarra","Charlotte Manetta","Marti Osteyee-Hoffman","Megan Swanby","Mike London","Michael Wang","Michael Yao","Mike Gwozdek","Miqueas Hernandez","Mitchell Kroska","Norberto Caceres","Patrick Skelley","Peter Kang","Philip Chung","Phillip Barnett","Pietro Martini","Robbie Santos","Rokas Simkonis","Ronu Ghoshal","Ryan Nebuda","Ryan Smith","Saralis Rivera","Sam Assadi","Spencer Alexander","Stephanie Major","Taylor Daugherty","Thomas Farr","Maeve Tierney","Tori Huang","Alexander Williams","Victor Wong","Xin Zhang","Zach Barton"]

# def create_groups(list)

# 	# create the number of non-standard group sizes (groups unequal to 4 members)
# 	group_size = 4	

# 	if list.length % 4 == 1
# 		second_groups = 1
# 		second_group_size = 5
# 	elsif list.length % 4 == 2
# 		second_groups = 2
# 		second_group_size = 5
# 	elsif list.length % 4 == 3
# 		second_groups = 1
# 		second_group_size = 3
# 	else
# 		second_groups = 1
# 		second_group_size = 4 # this creates 1 "non-standard" group that is identical to a 4-person standard group
# 	end

# 	#shuffle the array
# 	list.shuffle!

# 	#create non-standard groups first, standard groups second.
# 	acct_groups = {}
# 	group_label = 1
# 	list_index = 0
# 	for i in 1..(second_groups)
# 		acct_groups["Group #{group_label}"] = list[list_index..(list_index + (second_group_size - 1))]
# 		group_label += 1
# 		list_index += second_group_size
# 	end
# 	while list_index < list.length
# 		acct_groups["Group #{group_label}"] = list[list_index..(list_index + 3)]
# 		group_label += 1
# 		list_index += 4
# 	end
# 	return acct_groups
# end	


# REFACTORING TIME
#
# Things to try:
# f you run this program three times in a row, will the program give you three different outputs? Yes
#
# Should the program store past outputs? It should! But not implemented.
#
# If one person were to leave the cohort, how would the accountability groups change? Working on it!

def create_groups(list)

	list.shuffle!

	groups = list.each_slice(4).to_a

	if groups[-1].length < 3
		i = 0
		while groups[-1] != []
			groups[i].push groups[-1].delete_at(0)
			i += 1
		end	
		groups.delete_if { |empty| empty == [] }
	end

	acct_groups = {}
	group_label = 1

	groups.each do |group|
		acct_groups["Group #{group_label}"] = group
		group_label += 1
	end

	return acct_groups
end

assigned_groups = create_groups(students)

def display_groups(sorted_list) # takes hash, displays formatted list
	sorted_list.each do |group_num, students|
		puts "#{group_num}: #{students}"
	end
end 

display_groups(assigned_groups)	

def drop_student!(name, database) #searches the hash for a specific name and deletes if found, then redisplays the hash
	database.each do |group, students|
		if database[group].include?(name) then database[group].delete(name)
		end
	end
	display_groups(database)
	return database
end

drop_student!("Zach Barton", assigned_groups)

=begin

REFLECTIONS

- What was the most interesting and most difficult part of this challenge?

I thought that the open-endedness of this challenge was both the most interesting and the most difficult part.
It was really easy to get carried away if you weren't timeboxing this exercise. However, it allowed for a lot
of great learning to happen. After generating the initial working solution, there were a lot of improvements that
could be made - not only in refactoring, but also in building new functions to expand the scope of this exercise.

- Do you feel you are improving in your ability to write pseudocode and break the problem down?

Definitely! I thought that my pseudocode for this program was pretty accurate when matched up with my
initial solution. Without knowing all of the methods available, my initial solution was pretty complicated,
but I also followed the path I set ahead of myself.

- Was your approach for automating this task a good solution? What could have made it even better?

On the initial approach, it wasn't the most ideal solution I could have come up with. To evenly divide the
groups, I built a somewhat messy flow structure to create groups of 5 or 3 depending on the remainder,
assuming a defualt group size of 4. Then, the process I used to split the array into these group sizes
was way too complex for what was needed. I basically iterated through the (randomized) array of students
to fill a group and added it to the hash. I found out that it was easier to break the initial array into
sub-arrays, and then add THOSE to the hash.

- What data structure did you decide to store the accountability groups in and why?

I chose to store the accountability groups into a hash so they could easily be identified. The key is the
number of the group, while the value is an array of students in that group. This also seemed more convenient
than maintaining a complex nested array, since there is no explicit identification available for those.

- What did you learn in the process of refactoring your initial solution? Did you learn any new Ruby methods?

This was great! And I might have gotten a little carried away. First thing, after talking with some of the cohort
on Slack, was to apply the each_slice method to split the initial array of students. each_slice(num) will allow you
to get several sub-arrays with length equal to num. each_slice(num).to_a will nest those sub-arrays into a larger one.
Of course, this won't do anything if the remainder array is a smaller group of students than allowed, so I wrote
some extra lines of code to push the remainder into different groups. This gave me practice with the .push, .delete_at,
and .delete_if methods, and also using negative indexes. I also randomized the initial array each time with the .shuffle
method, making sure to set it to destructive to preserve the new order.

Once the sub-arrays were stored ahead of time, iterating these into a hash, with a counter variable to assign group numbers,
was fairly trivial.

To expand the scope, I created a second method that displayed the hash in a much nicer format. Then I began to work
on figuring out how to delete students if someone were to drop from the cohort. This third method takes a string and
a hash for the arguments, then searches the hash for that string. If found, that string is removed from the array stored
in the hash value. I would like to continue working on this in case a group is reduced to 2 members this way. Those
two members would be shuffled off into other groups that have less than 5 members in it (not necessarily ending in the same group).
I'm not sure how this works, and there's other work to do this week, but for future reference here's the pseudocode I'm
looking at:

def drop_student!(name, database)
	database.each do |group, students|
		if database[group].include?(name) then database[group].delete(name)

		PSEUDOCODE
			Check to see what the length of the array is after deleting the student
			If the length is less than 3
				we need to push the remaining objects into another array and
				delete the key-value pair
			Within this current iteration, we can begin ANOTHER iteration to search for values with length less than 5
				if we find one, we push as many objects as we can until the length equals 5
				we would continue searching for the next value if we still have more objects to push
			Once all objects have been pushed, we can stop there and leave an empty group.
			OR if we wanted to get fancy, we could delete the key-value pair
				Iterate through the hash one more time to re-assign group names to all the keys
			then end all sub-iterations and exit the method, returning the new hash - this is destructive.
		
		end
	end
	display_groups(database)
	return database
end
	
I'll come back to this later in the week if there's time!


=end