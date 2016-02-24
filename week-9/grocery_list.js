// PSEUDOCODE
//
// Requirements
// Define a grocery list
// Define several functions to add, modify, or remove items from the grocery list
// Display a formatted version of the grocery list

// Steps:
// 
// 1. Create an initial object to store the list
// 	Define a constructor that will generate a sample grocery list
//	Each property of the object will be equal to a grocery item
//	Each value will represent the quantity.

// 2. Create an add function
//	Add function takes a string and number argument
//	Assigns the string as a new property of the list object
//	Assigns the value as that property's value

// 3. Create a remove function
//	Remove function takes a string argument
//	IF that property is found in the object
//		That property and the value will be removed from the object

// 4. Create an update function
//	Update function takes a string argument
//	IF that property is found in the object
//		User is prompted to enter a new value
// 	ELSE go to the add function instead

// 5. Display function
//	Practice your HTML integration!

// Will need to create a nested object. Each item and quantity is its own object.
// All of these individual objects will be stored within a master object.

// Refactored solution
// Add methods to add, remove, and update built into the object itself

var masterList = {
	add: function(item, quantity) {
		this[item] = quantity;
	},
	remove: function(item) {
		if (this.hasOwnProperty(item) == true) {
			delete this[item];
		} else {
			console.log(item + " not found!");
		}
	},
	update: function(item, quantity) {
		if (this.hasOwnProperty(item) == false) {
			console.log(item + " not found. Adding " + item + " to the list instead.");
			this.add(item, quantity);
		} else {
			this[item] = quantity;
		}
	}
}

// Initial Solution

// function addItem(item, quantity) {
// 	masterList[item] = quantity
// } 	

// function removeItem(item) {
// 		if (masterList.hasOwnProperty(item) == true) {
// 			delete masterList[item];
// 		} else {
// 			console.log(item + " not found!");
// 		}
// }

// function updateItem(item, quantity) {
	// 	if (this.hasOwnProperty(item) == false) {
	// 		console.log(item + " not found. Adding " + item + " to the list instead.");
	// 		addItem(item, quantity);
	// 	} else {
	// 		this[item] = quantity;
	// 	}
	// }

console.log(masterList);
masterList.add("a", 1);
console.log(masterList);
masterList.add("b", 2);
masterList.add('c', 3);
console.log(masterList);
masterList.remove("b");
console.log(masterList);
masterList.remove("d");
masterList.update("e", 5);
console.log(masterList);