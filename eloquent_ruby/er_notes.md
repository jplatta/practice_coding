# Eloquent Ruby Notes

## Chapter 1: The Very Basics

* Uses two spaces, not tabs. 
* Good code speaks for itself. Go light on the comments
* Use camel case for classes.
* Use snakes for everything else.
* If defining a method with no parameters, then leave the parentheses off.
* Don't use parentheses for control statements.
* If your block consists of a single statement, then use a single line of code, i.e. braces.
* End yes/no or true/false methods with a question mark.
* End method names with an exclamation point if they do something unexpected or dangerous, e.g. change a class in place. 

## Chapter 2: Choose the Right Control Structure 

* Use "unless" instead of "!" 
* An until loop keeps going until its conditional part becomes true 
* Instead of "while !condition" use "until condition"
* Use the modifier version of if, unless, while, and until if the code an be written on one line
* Use each instead of for loops
* Case statements use the === operator 
  * Use case statements to detect a regular expression match 
* Ruby treats only `false` and `nil` as false and everything else as true
  * Avoid testing for truth by testing for specific values
* If you are looking for `nil` (e.g. the end of a list) and there is a possibility of `false` showing up, look for `nil` explicitly.
* Not sure if you need to initialize a variable then use 
```@first_name ||= ''``` which is the same as ```@first_name = '' unless @first_name``` which is also the same as ```@first_name = @first_name || ''```

## Chapter 3: Take Advantage of Ruby's Smart Collections 

## Chapter 4: Take Advantage of Ruby's Smart Strings

## Chapter 5: Find the Right String with Regular Expressions

## Chapter 6: Use Symbols to Stand for Something 

## Chapter 7: Treat Everything Like an Object - Because Everything IS

## Chapter 8: Embrace Dynamic Typing 

## Chapter 9: Write Specs!

## Chapter 17: Use Blocks to Iterate

