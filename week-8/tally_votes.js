// Tally Votes in JavaScript Pairing Challenge.

// I worked on this challenge with: Jones Melton, Ryan Nebuda
// This challenge took me [#] hours.

// These are the votes cast by each student. Do not alter these objects here.
var votes = {
  "Alex": { president: "Bob", vicePresident: "Devin", secretary: "Gail", treasurer: "Kerry" },
  "Bob": { president: "Mary", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Cindy": { president: "Cindy", vicePresident: "Hermann", secretary: "Bob", treasurer: "Bob" },
  "Devin": { president: "Louise", vicePresident: "John", secretary: "Bob", treasurer: "Fred" },
  "Ernest": { president: "Fred", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Fred": { president: "Louise", vicePresident: "Alex", secretary: "Ivy", treasurer: "Ivy" },
  "Gail": { president: "Fred", vicePresident: "Alex", secretary: "Ivy", treasurer: "Bob" },
  "Hermann": { president: "Ivy", vicePresident: "Kerry", secretary: "Fred", treasurer: "Ivy" },
  "Ivy": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Gail" },
  "John": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Kerry" },
  "Kerry": { president: "Fred", vicePresident: "Mary", secretary: "Fred", treasurer: "Ivy" },
  "Louise": { president: "Nate", vicePresident: "Alex", secretary: "Mary", treasurer: "Ivy" },
  "Mary": { president: "Louise", vicePresident: "Oscar", secretary: "Nate", treasurer: "Ivy" },
  "Nate": { president: "Oscar", vicePresident: "Hermann", secretary: "Fred", treasurer: "Tracy" },
  "Oscar": { president: "Paulina", vicePresident: "Nate", secretary: "Fred", treasurer: "Ivy" },
  "Paulina": { president: "Louise", vicePresident: "Bob", secretary: "Devin", treasurer: "Ivy" },
  "Quintin": { president: "Fred", vicePresident: "Hermann", secretary: "Fred", treasurer: "Bob" },
  "Romanda": { president: "Louise", vicePresident: "Steve", secretary: "Fred", treasurer: "Ivy" },
  "Steve": { president: "Tracy", vicePresident: "Kerry", secretary: "Oscar", treasurer: "Xavier" },
  "Tracy": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Ullyses": { president: "Louise", vicePresident: "Hermann", secretary: "Ivy", treasurer: "Bob" },
  "Valorie": { president: "Wesley", vicePresident: "Bob", secretary: "Alex", treasurer: "Ivy" },
  "Wesley": { president: "Bob", vicePresident: "Yvonne", secretary: "Valorie", treasurer: "Ivy" },
  "Xavier": { president: "Steve", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Yvonne": { president: "Bob", vicePresident: "Zane", secretary: "Fred", treasurer: "Hermann" },
  "Zane": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Mary" }
}

// Tally the votes in voteCount.
var voteCount = {
  president: {},
  vicePresident: {},
  secretary: {},
  treasurer: {}
}

/* The name of each student receiving a vote for an office should become a property
of the respective office in voteCount.  After Alex's votes have been tallied,
voteCount would be ...
  var voteCount = {
    president: { Bob: 1 },
    vicePresident: { Devin: 1 },
    secretary: { Gail: 1 },
    treasurer: { Kerry: 1 }
  }
*/


/* Once the votes have been tallied, assign each officer position the name of the
student who received the most votes. */
var officers = {
  president: undefined,
  vicePresident: undefined,
  secretary: undefined,
  treasurer: undefined
}

// Pseudocode
// first, iterate through main object
//  iterate through each property of the main object
//    add this nested property to vote count

// __________________________________________
// Initial Solution

// console.log(votes["Ivy"].secretary) //object["name"].position

// var tally = function(object) {
//   for (var voter in object) {
//     for (var ballot in object[voter]) {
//       console.log(voteCount[ballot])
//     }
//   }
// }

var tally = function(object) {
  for (var voter in object) {
    ballot = object[voter];
    for (var position in ballot) {
      votes = ballot[position]
      if (voteCount[position].hasOwnProperty(ballot[position])) {
        voteCount[position][votes] += 1;
      } else {
        voteCount[position][votes] = 1;
      }
      // console.log(position)
      // console.log(name[position])
      // console.log("inner loop end");
    }
    // console.log(voter);
    // console.log(name);

    // console.log("end loop");

    // for (var position in name) {
    //   for (var ballot in object[voter][position]);
    //     // console.log(object[voter][position]);
    //     if (voteCount[position][ballot] === undefined) {
    //         voteCount[position][ballot] = 0;
    //     } else {
    //       voteCount[position][ballot] += 1;
      // } //end if
    // }
  }



  for (position in voteCount) {
    var highest = 0;
    var winner = "";
    for (candidate in voteCount[position]) {
      if (voteCount[position][candidate] > highest) {
        highest = voteCount[position][candidate];
        winner = candidate;
      }
    }
    officers[position] = winner;
  }

}

tally(votes);


// __________________________________________
// Refactored Solution






// __________________________________________
// Reflection

// What did you learn about iterating over nested objects in JavaScript?

// It's very difficult to follow the iterative process over successive loops. During this challenge, we had
// a difficult time understanding which properties we were accessing at different levels of iteration. We
// were able to understand this by assigning clearer placeholder variable names to different levels of the
// nested object, so that we would get the results we were expecting. We also learned about the importance of
// bracket notation versus dot notation.

// Were you able to find useful methods to help you with this?

// The only new method we introduced into this program was the "hasOwnProperty" method. We used this on
// the voteCount object to determine if a vote had already been counted for a specific person in a specific
// position. This allowed us to determine whether to initialize a property for that person, or increase the
// value instead.

// What concepts were solidified in the process of working through this challenge?

// I think we gained a lot of knowledge on how to debug JavaScript. We used a lot of console.log statements
// within our loops to understand exactly what was being returned at different steps of the iterative
// process. We learned how to break down the code into smaller steps and solve the problem one small piece
// at a time.


// __________________________________________
// Test Code:  Do not alter code below this line.


function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}

assert(
  (voteCount.president["Bob"] === 3),
  "Bob should receive three votes for President.",
  "1. "
)

assert(
  (voteCount.vicePresident["Bob"] === 2),
  "Bob should receive two votes for Vice President.",
  "2. "
)

assert(
  (voteCount.secretary["Bob"] === 2),
  "Bob should receive two votes for Secretary.",
  "3. "
)

assert(
  (voteCount.treasurer["Bob"] === 4),
  "Bob should receive four votes for Treasurer.",
  "4. "
)

assert(
  (officers.president === "Louise"),
  "Louise should be elected President.",
  "5. "
)

assert(
  (officers.vicePresident === "Hermann"),
  "Hermann should be elected Vice President.",
  "6. "
)

assert(
  (officers.secretary === "Fred"),
  "Fred should be elected Secretary.",
  "7. "
)

assert(
  (officers.treasurer === "Ivy"),
  "Ivy should be elected Treasurer.",
  "8. "
)