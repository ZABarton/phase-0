// Initial solution

// Sum

var sum = function(array) {
  var total = 0;
  for (var i = 0; i < array.length; i++) {
        total += array[i];
  }
  return total;
}
// var array = [1,2,3,4,5]
// console.log(sum(array));

// USER STORY
// As a user, I want the computer to do something meaningful with a long list of data I have. If I give the
// computer a bunch of numbers, I want the computer to add all of them together and tell me what the sum is.  

// Mean

var mean = function(array) {
  var total = 0;
  for (var i = 0; i < array.length; i++) {
        total += array[i];
  }
  return total/array.length;
}

// USER STORY
// As a user, I want the computer to calculate an average value from a long list of numbers that I have. I
// would like it to count the sum of my data, as well as how many data points I have, and use those results to
// determine the average.

// Median

function median(numbers) {
  numbers.sort( function(a,b) {return a - b;} );
    var half = Math.floor(numbers.length/2);
      if(numbers.length % 2)
        return numbers[half];
      else
        return (numbers[half-1] + numbers[half]) / 2.0;
}
// var array = [2,4,5,1,6,7,3,9,0];
// median(array);

// USER STORY
// As a user, I want the computer to look at a long list of numbers and provide a basic statistical analysis.
// Specifically, I want the computer to give me the median as a single value. By definition, half of the values in my list
// will fall below the median, and the other half will fall above it. 