// Eloquent JavaScript

// Run this file in your terminal using `node my_solution.js`. Make sure it works before moving on!

// Program Structure
// Write your own variable and do something to it.

var number = 5
number *= 2
console.log(number)

// Complete one of the exercises: Looping a Triangle, FizzBuzz, or Chess Board



// Functions

// Complete the `minimum` exercise.



// Data Structures: Objects and Arrays
// Create an object called "me" that stores your name, age, 3 favorite foods, and a quirk below.

// Did you learn anything new about JavaScript or programming in general?
//
// JavaScript is entirely new to me, so learning about the history of how it came to be and what it is used for. 
// A lot of the fundamental concepts behind programming read similar to what was presented in the Ruby material, 
// so I think that learning JavaScript will mainly be about learning the new syntax and flow to achieve the same 
// results we've been working towards with Ruby.

// Are there any concepts you feel uncomfortable with?
//
// I'm a little nervous to start working in a new language as I'm still getting the hang of Ruby, but I think 
// there should be enough similarities to help make this understandable.

// Identify two similarities and two differences between JavaScript and Ruby syntax with regard to numbers, 
// arithmetic, strings, booleans, and various operators.
//
// After reading this chapter, I feel pretty good about the similarities between JavaScript and Ruby operators. 
// There are quite a few similarities. First off, all of the basic arithmetic and boolean operators between JS 
// and Ruby are the same - && always means "and", % means modulus, != means not equal to, etc. Strings also operate 
// in the same manner in both languages. You can concatenate strings together using addition in JS, just like in 
// Ruby. However, there are also a few key differences to keep in mind. If we tried to add a string and a number 
// together in Ruby, we would receive a type error that would let us know we used the wrong type of variable in our 
// code. In JS, it will automatically try to convert the "wrong" variable to the "right" type, giving us a possibly 
// unexpected result while not displaying an error. Therefore, type errors can be much harder to diagnose in JS than
// in Ruby. The other major difference is that we receive an extra set of operators to check for true equivalencies
// without any type conversion. We can use === and !== (note the extra equal signs) to check to see if the precise
// values on both sides of the equation are truly equal.

// What is an expression?
//
// An expression is simply a fragment of code that produces a value. This value does not need to be stored or 
// used anywhere else - an expression simply generates a value.

// What is the purpose of semicolons in JavaScript? Are they always required?
//
// A semicolon signifies the end of a statement at the end of the line, so the next line is treated as a new
// statement. Semicolons are not always required, but the cases in which you can safely omit them is not
// readily apparent. It is safer to end a statement with a semicolon to acheive the desired result.


// What causes a variable to return undefined?
//
// A variable will return undefined if you first define a variable without assigning an expression to it. 
// Calling the variable will work because it exists, but will then return undefined because it is empty. 
// This is different than calling a variable that has not been defined yet - in this case, the program 
// will throw an error because you are referring to a variable that doesn't actually exist.

// Write your own variable and do something to it in the eloquent.js file.

var number = 5
number *= 2
console.log(number)

// What does console.log do and when would you use it? What Ruby method(s) is this similar to?
//
// console.log provides a value for some form of text output. When running node.js from the command
// line, that text output will occur in the shell. In a browser, though, that output will occur within
// the browser itself and can be viewed through the developer tools. Console.log is for when you need to
// display a value in readable format. In this way, it is similar to the puts or print command in Ruby.

// Write a short program that asks for a user to input their favorite food. After they hit return, 
// have the program respond with "Hey! That's my favorite too!" (You will probably need to run this 
// in the Chrome console (Links to an external site.) rather than node since node does not support 
// prompt or alert). Paste your program into the eloquent.js file.

prompt("What's your favorite food?")
console.log("Hey, that's my favorite too!")

// Describe while and for loops
//
// A while loop allows a loop to iterate until a given condition is met. A for loop will iterate
// for as many times as specified in a for statement. This allows two different type of break conditions.
// The for loop will run for specified set of iterations, and the while loop will run for some
// unspecified time until the condition is met. Both types are useful depending on the function
// of the loop.

// What other similarities or differences between Ruby and JavaScript did you notice in this section?
//
// JavaScript has a new special number, NaN, that stands for Not a Number. This can be generated by running
// a mathematical equation such as x / 0 or Infinity - Infinity, where the answer isn't precise or meaninful.
// In Ruby, this would normally generate an error instead. JavaScript has a function isNaN to check for this
// and return true if NaN is found. This means there is a specific function to handle Nan errors inside the code 
// rather than rewriting the structure within Ruby to avoid NaN errors altogether.

// Complete at least one of the exercises (Looping a Triangle, FizzBuzz, of Chess Board) in the eloquent.js file.
//
// Looping Triangle
row = "#";
while(row.length <= 7) {
	console.log(row);
	row += "#";
}

// FizzBuzz
for (var counter = 1; counter <= 100; counter++)
	if (counter % 3 == 0 && counter % 5 == 0)
		console.log("FizzBuzz");
	else if (counter % 3 == 0)
		console.log("Fizz");
	else if (counter % 5 == 0)
		console.log("Buzz");
	else
		console.log(counter);

// Chessboard

var board = "";
var size = 8;
for (var row = 1; row <= size; row++) {
	for (var counter = 1; counter <= 8; counter ++) {
		if (board.length % 2 == 0)
			board = board + "#";
		else
			board = board + "_";
	}
	board = board + "\n";
}

console.log(board)

// What are the differences between local and global variables in JavaScript?
//
// Local variables are variables that are declared within functions, while global variables
// are declared outside of functions. Global variables can be used anywhere within the program.
// For instance, if you declared the variable "number" outside a function, you could refer to it
// within a function by calling "number" itself. However, you could also declare a local variable
// within the function also called number using the var "number" syntax. This local variable will
// only be used within the function and will not overwrite the global variable.

// When should you use functions?
//
// Functions work very similarly to methods in Ruby. You should use a function to create a block of
// code that can be executed multiple times without having to type out that block each and every
// time you want to call it.

// What is a function declaration?
//
// A function declaration is declaring a variable and assigning a function expression to it. The function
// expression is specified by starting with a function keyword followed by the expression that generates
// the value of the function. This can be written shorthand by leading with the function keyword, removing
// the need for a variable declaration.

// Complete the minimum exercise in the eloquent.js file.

function min(number1, number2) {
	if (number1 <= number2)
		return number1;
	else 
		return number2;
}

console.log(min(0,-10))
console.log(min(6,3))
console.log(min(10,10))

// What is the difference between using a dot and a bracket to look up a property? Ex. array.max vs array["max"]
//
// While each of these approaches allow you to look up a property, they will not necessary return the same property.
// The difference is that using array.max will specifically return the .max property as long as it is a valid property.
// When using brackets, the variable "max" will be evaluated first and a different property will be returned. In this
// example, what this means is the .max variable will return the maximum value in an array, while the ["max"] variable
// will evaluate the value in the array stored under the "max" index and return that instead.

// Create an object called me that stores your name, age, three favorite foods, and a quirk in your eloquent.js file.
var me = {
	name: "Zach Barton",
	age: 32,
	fav_foods: ["Pork Belly Ramen", "Pie", "Sausage Pizza"],
	quirk: "I design board games."
}

console.log(me.fav_foods)

// What is a JavaScript object with a name and value property similar to in Ruby?
//
// The above object we defined is very similar to a hash in Ruby. We've created a data structure with
// key-value pairs, where the values can be any type of value, including strings, integers, and arrays.
