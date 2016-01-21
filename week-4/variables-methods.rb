puts 'Hello, what is your first name?'
	firstname = gets.chomp
puts 'Great! What is your middle name?'
	middlename = gets.chomp
puts 'Last question: What is your last name?'
	lastname = gets.chomp
puts 'Well, nice to meet you, ' + firstname + ' ' + middlename + ' ' + lastname
puts 'Now, ' + firstname + ', could you tell me your favorite number?'
	favnum = gets.chomp
	betternum = favnum.to_i + 1
puts 'Your number is awful. ' + betternum.to_s + ' is a much better number.'

=begin
How do you define a local variable?

You can set a local variable by introducing it and setting it equal to a default
value, such as var1 == value. This local variable will remain the same until
it is redefined further in the code.

How do you define a method?

Methods begin with the def command and finish with the end command. Def uses
the following syntax: def method_name(arguments). A method can take any
number or types of arguments.

What is the difference between a local variable and a method?

A method is a block of code that can be repeated throughout your program.
Methods can include local variables. Methods can also be appended to variables
to modify their contents without changing the variable itself. A local variable
is a declared value that can be stored and modified throughout the program.

How do you run a ruby program from the command line?

Ruby programs are run using the following syntax: ruby [FILENAME].rb

How do you run an RSpec file from the command line?

Rspec files are run using the following syntax: rspec [SPEC_FILENAME].rb

What was confusing about this material? What made sense?

I thought that this material was very straightforward. All of these exercises
are great refresher courses from the Dev Bootcamp application process and the
Codecademy Ruby track. I'm finding that the syntax for Ruby is very intuitive
and readable, which makes it easy to remember.

Links to challenges below:
https://github.com/ZABarton/phase-0/blob/master/week-4/address/my_solution.rb
https://github.com/ZABarton/phase-0/blob/master/week-4/math/my_solution.rb
https://github.com/ZABarton/phase-0/blob/master/week-4/define-method/my_solution.rb