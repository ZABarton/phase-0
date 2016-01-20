# Release 1 Questions

## What does puts do?

Puts is a method of outputting data visually so that it can be read. Puts is simply a way of displaying data. It does not actually return any data from the program to be used later on.

## What is an integer? What is a float?

An integer is a round number with no decimal point. A floating number is a number that has the decimal information stored. Floating numbers can also be round numbers - for example, 3.0 is still considered a floating number. The only difference between the integer 3 and the float 3.0 is that the the decimal information is stored and used in calculations involving floating numbers.

## What is the difference between float and integer division? How would you explain the difference to someone who doesn't know anything about programming?

The difference between float and integer division is that floating division provides an exact value with fractional information, while integer division deals solely with whole numbers and disregards fractional information. This means that integer division resulting in a non-integer quotient will automatically get rounded down - for instance, 10/3 will compute to 3 using integer division.

```
hours_in_year = 365*24
puts hours_in_year

mins_in_decade = 10*365*24*60
puts mins_in_decade
```

# Release 7 Reflections

## How does Ruby handle addition, subtraction, multiplication, and division of numbers?

Ruby handles basic mathematical operations in the order you would normally expect - parentheticals, exponents, multiplication, division, addition, and subtraction. Ruby also reads the math equations from left to right - for example, num1 - num2 provides a different result than num2 - num1.

## What is the difference between integers and floats?

Floating numbers store fractional information while integers do not. This means that calculations involving integers will only return integers. Calculations that use floating numbers throughout the math operations will display a floating number result.

## What is the difference between integer and float division?

Integer division will provide an integer result. If your division would result in a non-integer number, the result would be automatically converted into an integer, rounded down. This is useful if you are trying to measure discrete objects (number of tickets, units sold, etc) but could also throw away needed information for different applications. To preserve the fractional information, float division is used. Both arguments would need to be floating numbers to provide a float quotient.

## What are strings? Why and when would you use them?

Strings are used to display text information. These are useful for displaying information that the user is expected to read, as well as taking text inputs. Any text stored as an input or output should be stored in a string format.

## What are local variables? Why and when would you use them?

Local variables are variables that are specific to a certain section of code, such as a method or loop. They cannot be accessed outside of these sections. This allows you to create variables such as counters for loops or temporary storage within a method without interfering with the rest of the code.
    
## How was this challenge? Did you get a good review of some of the basics?

This was a great refresher. I kind of set aside Ruby after clearing the interview process, but I was pleasantly surprised by how much knowledge was retained. I'm looking forward to diving deeper into it!

# Challenge Links

[Defining Variables](./defining-variables.rb)  
[Simple String Methods](./simple-string.rb)  
[Local Variables and Basic Arithmetical Operations](./basic-math.rb)  