# Strings

### Notes
* Single quotes `''` and double quotes `""` are the same except that you have to escape quote literals.
*

### String Methods
```javascript
let firstName = "Joseph"

firstName.length;
firstName.toLowerCase();
firstName.toUpperCase();

//Use the charAt() string method to access a character at a given index
firstName.charAt(0) //returns "J"
//...or use...
firstName[0] //returns "J"

//interpolation - use backticks with dollar sign and brackets
`Hallo, ich heisse ${firstName}.`

if(firstName.includes("J")){
    console.log("This name includes a 'J'");
}
```

### Iterate through a string (the wrong way)
```javascript
let lieblingsWort = "ausgezeichnet"

for(let i = 0; i < lieblingsWort.length; i++){
    console.log(lieblingsWort.charAt(i));
}
```
