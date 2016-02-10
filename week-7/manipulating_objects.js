 // Manipulating JavaScript Objects

// I worked on this challenge: [by myself, with: ]

// There is a section below where you will write your code.

// DO NOT ALTER THIS OBJECT BY ADDING ANYTHING WITHIN THE CURLY BRACES!
var terah = {
  name: "Terah",
  age: 32,
  height: 66,
  weight: 130,
  hairColor: "brown",
  eyeColor: "brown"
}
// __________________________________________
// Write your code below.

var adam = {
  name: 'Adam'
}

terah = {
  spouse: adam,
  weight: 125
}

terah.spouse.spouse = terah

terah.children = {}

carson = {
  name: "Carson"
}

carter = {
  name: "Carter"
}

colton = {
  name: "Colton"
}

terah.children = {
  carson,
  carter,
  colton
}

adam.children = terah.children

// __________________________________________
// Reflection: Use the reflection guidelines
//
// What tests did you have trouble passing? What did you do to make it pass? Why did that work?
// 
// I had a lot of trouble getting Terah's spouse's spouse to refer back to the terah object. At first,
// I just put a spouse property in the adam object that refers to the terah object. This didn't pass the test,
// and I wasn't sure why. If terah.spouse is equal to the adam object, and adam.spouse is already equal to terah,
// wouldn't terah.spouse.spouse already be set equal to terah? To fix this, I just literally wrote out the code
// as straightforward as possible. This works, but gives a circular reference in the terah object. I'm not
// 100% sure this is the correct way to handle this.

// How difficult was it to add and delete properties outside of the object itself?
//
// Adding and deleting properties outside of the object seems straightforward enough. Just like adding a new value
// into a Ruby hash, you can just define a new "key-value" pair and if it doesn't exist, it will be added to the
// object. If it does exist, then the object will just get modified with the new property and value. The delete command
// is surprisingly semantic and straightforward, which is nice.

// What did you learn about manipulating objects in this challenge?
//
// It's similar to thinking about the placeholder variables in Ruby iterations. You have to be very mindful of what
// the object.method is referring to. Once you can understand exactly which part of the object you are modifying, then
// the syntax to manipulate objects kind of falls into place. I can definitely stand to practice this exercise more so
// that I understand why things work the way they do.
//
//


// __________________________________________
// Driver Code:  Do not alter code below this line.
function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}

assert(
  (adam instanceof Object),
  "The value of adam should be an Object.",
  "1. "
)

assert(
  (adam.name === "Adam"),
  "The value of the adam name property should be 'Adam'.",
  "2. "
)

assert(
  terah.spouse === adam,
  "terah should have a spouse property with the value of the object adam.",
  "3. "
)

assert(
  terah.weight === 125,
  "The terah weight property should be 125.",
  "4. "
)

assert(
  terah.eyeColor === undefined || null,
  "The terah eyeColor property should be deleted.",
  "5. "
)

assert(
  terah.spouse.spouse === terah,
  "Terah's spouse's spouse property should refer back to the terah object.",
  "6. "
)

assert(
  (terah.children instanceof Object),
  "The value of the terah children property should be defined as an Object.",
  "7. "
)

assert(
  (terah.children.carson instanceof Object),
  "carson should be defined as an object and assigned as a child of Terah",
  "8. "
  )

assert(
  terah.children.carson.name === "Carson",
  "Terah's children should include an object called carson which has a name property equal to 'Carson'.",
  "9. "
)

assert(
  (terah.children.carter instanceof Object),
  "carter should be defined as an object and assigned as a child of Terah",
  "10. "
  )

assert(
  terah.children.carter.name === "Carter",
  "Terah's children should include an object called carter which has a name property equal to 'Carter'.",
  "11. "
)

assert(
  (terah.children.colton instanceof Object),
  "colton should be defined as an object and assigned as a child of Terah",
  "12. "
  )

assert(
  terah.children.colton.name === "Colton",
  "Terah's children should include an object called colton which has a name property equal to 'Colton'.",
  "13. "
)

assert(
  adam.children === terah.children,
  "The value of the adam children property should be equal to the value of the terah children property",
  "14. "
)

console.log("\nHere is your final terah object:")
console.log(terah)