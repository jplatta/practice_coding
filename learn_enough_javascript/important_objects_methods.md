# General JavaScript notes

* JavaScript has single numerical type, i.e. floats, and so treats all number as floating point numbers

### Add Javascript directly to html
```html
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset='utf-8'>
        <script>
            alert("Guten Tag Welt!");
        </script>
    </head>
    <body>
    </body>
</html>
```

### Create a variable 
* Use camel case
* `let` and `var` are interchangeable, but use `let`
* `const` for constants?

```javascript 
let firstName = "Joseph";
let lastName = "Platta";

console.log(firstName, lastName);

const FROGCOUNT = 20;
```

### Conditionals
```javascript
let firstName = "Joseph";

if(firstName.length === 6) {
    console.log("Das ist ein schone Name.");
} else if(firstName.length < 6) {
    console.log("Das Name ist kreuz.");
}
else {
    console.log("Der Name ist lang.");
}
```

### Math Global Object
```javascript
Math.PI; //returns 3.141592653589793
Math.pow(2,3); //returns 8
Math.sqrt(4); //returns 2
Math.cos(2*Math.PI); //returns 1
Math.E;
Math.log(Math.E); //returns 1
Math.log10(10); //returns 1
```