// Separate Numbers with Commas in JavaScript **Pairing Challenge**


// I worked on this challenge with: Pietro.

// Pseudocode



// Initial Solution

// function separateComma(number) {
//   var reverseArray = number.toString().split("").reverse("");
//   var array = [];
  
// for (var item in reverseArray) {
//   if ((reverseArray.indexOf(reverseArray[item]) + 1) % 3 === 0) {
//     array.push(reverseArray[item]) && array.push(",");
//   }
//   else { 
//     array.push(reverseArray[item]);
//   }
// }
//   if (array[array.length - 1] === ",") {
//     array.pop();
//     // array.splice([-1], 1);
//   }
//    return array
// }

// console.log(separateComma(1123456789012));

// Refactored Solution
// use a combination of substring methods to insert a comma into place

// var output = a.substr(0, position) + b + a.substr(position);

// get a number
// check number.,length % 3 to find out starting position for comma
// if length % 3 == 0, then start at 3

// a = number
// b some position 1 - 3

// loop through the number, as long as b is less than total length
// number.substring(0, b) + "," + number.subtring(position)
// b += 4

// function refactorComma(number) {
//   var str_num = number.toString();
//   var starting_index = str_num.length % 3;
//   var output = [];
//   var comma = ","
  
//     if (starting_index === 0) {
//       var comma = "";
//     }
  
//   output.push(str_num.substr(0, starting_index) + comma);
//   str_num = str_num.replace(str_num.substr(0, starting_index), '');
  
//   console.log(str_num);
//   for (var counter = 0; counter+3 < str_num.length; counter) {
//     output.push(str_num.substr(0, 3) + ",")
//     str_num = str_num.replace(str_num.substr(0, 3), '');
//   }
//   output.push(str_num);
//   return output.join('');
// }

// refactor once more for readability

function refactorComma(number) {
  var string = number.toString();
  var starting_index = string.length % 3;
  var output = [];
  var comma = ",";
  var subRange = string.substr(0, starting_index);
  
    if (starting_index === 0) {
      var comma = "";
    }
  
  output.push(subRange + comma);
  string = string.replace(subRange, '');
  
  while(string.length > 3) {
    var nextThreeDigits = string.substr(0, 3);
    output.push(nextThreeDigits + ",")
    string = string.replace(nextThreeDigits, '');
    // console.log(nextThreeDigits);
  }
  output.push(string);
  return output.join('');

}
// Your Own Tests (OPTIONAL)

// Reflection

// What was it like to approach the problem from the perspective of JavaScript? Did you approach the problem differently?

// We started to approach this differently because the commands we initially wanted seemed unavailable for us
// in JavaScript. We knew that we wanted to work with an array and iterate over it, but we had to come up with our
// own methods to put commas where we wanted them.

// What did you learn about iterating over arrays in JavaScript?

// I learned that I really missed enumerable methods. We were able to solve our problem with a for loop that
// iterated over each index, but writing the loop and the code within it seemed like it was messier and more
// complicated. However, the logic behind iterating over arrays, whether in JS or Ruby, seemed similar.

// What was different about solving this problem in JavaScript?

// I missed some of the built-in methods available to us in Ruby. In our refactored solution, the insert method would
// have been really handy to have, especially in a string method rather than an array. Instead, we kind of had to
// make up our own.

// What built-in methods did you find to incorporate in your refactored solution?

// We used the substring method to isolate a three character chunk of a string and then added a comma to the end of
// that chunk. Then, we used the string replace method to delete that chunk from the string after we had pushed it into
// a new array. That way, we didn't need to iterate over the string character by character. Instead, the string would become
// shorter and shorter until the length terminated a while loop.