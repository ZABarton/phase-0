# Research Methods

# I spent [] hours on this challenge.

i_want_pets = ["I", "want", 3, "pets", "but", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Ditto" => 3, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0}

=begin
PSEUDOCODE

array finding method:

pass in the array, and the substring to find
iterate over the array
  convert index to string
  check to see if string contains substring
    if yes, push to new array
    if no, skip  
  return the new array

hash finding method:

pass in the hash and a number argument
iterate over the hash, searching for key-value pairs
  check to see if value equals the number argument
    if yes, push the key to new array
    if no, skip
  return the new array
=end

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
  new_array = []
  source.each do |word|
    if word.to_s.include? thing_to_find.to_s
      new_array << word
    else
    end
  end
  return new_array
end

def my_hash_finding_method(source, thing_to_find)
  new_array = []
  source.each do |key, value|
    if value == thing_to_find
      new_array << key.to_s
    else
    end
  end
  return new_array
end

puts my_hash_finding_method(my_family_pets_ages, 3)

# COMMENTS

# Identify and describe the Ruby method(s) you implemented.

# I used the each method in both examples to iterate over an array and a hash. The difference
# between iterating over an array and a hash is that the do loop for a hash requires two arguments
# so that both the key and the values can be accessed.
# 
# To check if a string contains a certain letter or other substring, I used the .include? method
# to check if each string in the array contains the thing_to_find argument. The include method syntax
# looks like this: string.include? "substring" and will return true if the string contains the substring.
#
# Finally, I used the .to_s method to explicitly change the variables into strings before returning
# them out of the method.
#
# For searching through the ruby documentation, I just looked for the page corresponding to the class
# I wanted to apply a method to (string, hash, array, etc.) and searched the page for a method that
# sounded similar to function I wanted to perform.
#
=begin
# Person 2
def my_array_modification_method!(source, thing_to_modify)
  source.dup # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

def my_hash_modification_method!(source, thing_to_modify)
  source.dup # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Person 3
def my_array_sorting_method(source)
  source # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

def my_hash_sorting_method(source)
   source # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Person 4
def my_array_deletion_method!(source, thing_to_delete)
  source.dup # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

def my_hash_deletion_method!(source, thing_to_delete)
  source.dup # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Person 5
def my_array_splitting_method(source)
  source # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

def my_hash_splitting_method(source, age)
  source # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Release 1: Identify and describe the Ruby method you implemented. Teach your
# accountability group how to use the methods.
#
#
#


# Release 3: Reflect!
# What did you learn about researching and explaining your research to others?
#
#
#
#
=end