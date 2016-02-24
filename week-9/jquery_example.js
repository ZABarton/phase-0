// U3.W9:JQuery


// I worked on this challenge with Rocky.
// This challenge took me [1.5] hours.

$(document).ready(function(){

//RELEASE 0:
  //link the image

//RELEASE 1:

  //Link this script and the jQuery library to the jQuery_example.html file and analyze what this code does.

$('body').css({'background-color': 'pink'})

//RELEASE 2:
  //Add code here to select elements of the DOM

bodyElement = $('body');
h1Element = $('h1');
headerElement  = $('header');
mascotClass = $('.mascot');
logoElement = $('.mascot img');

//RELEASE 3:
  // Add code here to modify the css and html of DOM elements

mascotClass.css({'border': '2px solid #000'})
logoElement.css({'border': '3px dashed #000'})

cohort = $('.mascot h1')
cohort.html()

//RELEASE 4: Event Listener
  // Add the code for the event listener here


//RELEASE 5: Experiment on your own

// $('.mascot img').hover(function() {
// 	$('.mascot img').replaceWith($("<img src='poop.jpg' alt='It is Poop'/>"))
// 	console.log("Hover on")
// 	$('.mascot img').replaceWith($("<img src='dbc_logo.png' alt='Real DBC logo' />"))
// 	console.log("Hover off");	
// });

    $('.mascot img').hover(function () {
        this.src = 'poop.jpg';
    }, function () {
        this.src = 'dbc_logo.png';
    });




})  // end of the document.ready function: do not remove or write DOM manipulation below this

// What is jQuery?

// jQuery is an easier way to modify HTML elements using JavaScript. jQuery uses selectors to pick certain HTML
// elements and dynamically modify them while the page is already loaded.

// What does jQuery do for you?

// jQuery is a simple way to pick specific elements in the HTML page and allow you to modify different attributes
// in a straightfoward manner. By using the same selectors that you would normally use in CSS, you can apply different
// code and manipulations to certain objects in specific sections of the HTML document tree.

// What did you learn about the DOM while working on this challenge?

// There is a lot of stuff that you can do directly from the console! It made it very easy to debug certain
// issues with the jQuery manipulation commands because you could see exactly how the HTML was changing. Every
// time there was an issue, you could do all of the debugging from the console first before ever having to go
// back into Sublime and changing a single line of code. It's a big time-saver!