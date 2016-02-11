// JavaScript Olympics

// I paired with Ryan Smith on this challenge.

// This challenge took me [#] hours.


// Warm Up




// Bulk Up
// PSEUDOCODE
// create a function that takes an array
// 	this array contains objects representing athletes, each athlete has two properties: name, event
// 	function will add a third property to each athlete - the win property.
// the win property will print a string containing the other two properties
// 	the win property will then actually be a function

var athletes = [{name: "Michael Jordan", sport: "Basketball"}, {name: "Tonya Harding", sport: "Figure Skating"}];

function add_win(array) {
	for (var index = 0; index < array.length; index++) {
		// athletes[index]["win"] = athletes[index]["name"] + " is the best at " + athletes[index]["sport"]
		athletes[index]["win"] = function() {
			console.log(this.name + " is the best at " + this.sport);
	  }
	}
}

add_win(athletes);
athletes[1].win();


// Jumble your words

function reverse_string (str) {
  var new_string = '';
  for (var i = str.length - 1; i >= 0; i--) {
    new_string += str.charAt(i);
  }
  return new_string;
}

console.log(reverse_string('Hello my name is Ryan!'));

// 2,4,6,8

var numbers = [1,2,3,4,5,6,7,8];

// non-destructive

function even_numbers(array) {
  var new_array = [];
  for (var i = 0; i < array.length; i++) {
    if (array[i] % 2 == 0) {
      new_array.push(array[i]);
    }
  }
  return new_array;
}

console.log(even_numbers(numbers));

//destructive

function even_numbers(array) {
  for (var i = 0; i < array.length; i++) {
    if (array[i] % 2 != 0) {
      array.splice(i, 1)
    }
  }
  return array;
}

console.log(even_numbers(numbers));


// "We built this city"

function Athlete (name, age, sport, quote) {
  this.name = name;
  this.age = age;
  this.sport = sport;
  this.quote = quote;
  this.greet = function() {
    return "My name is " + this.name + ", and I'm " + this.age + " years old.";
  };
}

var michaelPhelps = new Athlete("Michael Phelps", 29, "swimming", "It's medicinal I swear!")
console.log(michaelPhelps.constructor === Athlete)
console.log(michaelPhelps.name + " " + michaelPhelps.sport + " " + michaelPhelps.quote)

// var tigerWoods = new Athlete("Tiger Woods", 43, 'golf', 'Wow! A hole in one!');

// console.log(tigerWoods.greet);
// console.log(michaelPhelps.greet);

// tigerWoods.name = "Bobby Flay";

// console.log(tigerWoods);
// console.log(tigerWoods.greet());

// tigerWoods.name = "Phillip Jones";

// console.log(tigerWoods.greet());
// console.log(tigerWoods.name);

// tigerWoods.age++;

// tigerWoods.howOld = "I am " + tigerWoods.age + " years old.";

// console.log(tigerWoods.greet());
// console.log(michaelPhelps.prototype);


// Reflection

// What JavaScript knowledge did you solidify in this challenge?
//
// The biggest concept I learned during this exercise was defining functions inside an object
// as a property value. This seems very similar to defining a class method as part of a class
// in Ruby. In JavaScript, you can give each object a function as part of a property, so that
// you can run that function for any object and access the other properties of that object. This
// also allows you to access changes to those properties in the case of a constructor. For instance,
// the variable passed into a constructor will remain constant, even if we change the property value
// manually. If we access those property values through a function, we will always get the latest
// value. 

// What are constructor functions?
//
// Constructor functions are very similar to initializing a new object in Ruby. Given some number of
// arguments (including none), the constructor function will generate a new object with some number
// of properties. We can use arguments to differentiate the objects from each other and give them
// different properties.

// How are constructors different from Ruby classes (in your research)?
//
// The biggest difference is that the constructor in JavaScript is only equivalent to the initialize
// method within a Ruby class. This means that Ruby classes are more robust because we can use class
// methods and instance variables to retain common information between instances. Constructors will
// only generate a new object. It is possible to include functions within a constructor but this is
// less intuitive than defining class methods in Ruby.
