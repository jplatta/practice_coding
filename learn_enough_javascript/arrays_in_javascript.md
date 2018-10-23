# Arrays

### Notes
* Objects in an a particular array can have different types
* 

### Methods
```javascript
//split a string to an array
"Hund Vogel Pferd".split(" "); //returns  ["Hund", "Vogel", "Pferd"]
"Hund,Vogel,Pferd".split(","); //returns  ["Hund", "Vogel", "Pferd"]

//Create an array of characters
'pferd'.split(''); //returns ['p','f','e','r','d']

//Accessing objects in an array
let germanHorse = 'pferd'.split('');
germanHorse[0]; //returns 'p'

//Slicing 
germanHorse.slice(1); //returns ['f','e','r','d']
germanHorse.slice(1, 3); //returns ['f','e']
germanHorse.slice(-1); //returns ['d']

//Includes 
germanHorse.includes('d'); //returns true

//sort and reverese - sort and reverse are in place, i.e. they mutate the array
let nums = [6,2,3];
nums.sort(); //returns [2, 3, 6] 
nums.reverse(); //returns [6, 3, 2]

//push and pop
let nums = [1,2,3];
nums.pop(); //returns 3
nums.push(5); //returns the length of the new array, i.e. 4. The new array is [1, 2, 5]

//concat an array
let names = ['Joe', 'Matt', 'Ben'];
names.join(); //returns JoeMattBen
names.join(', '); //returns Joe, Matt, Ben
```