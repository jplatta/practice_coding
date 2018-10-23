# Writing Scripts with Node and JavaScript

1. Example script: `lieblingswort`
```bash
#!/usr/local/bin/node

let lieblingsWort = "ausgezeichnet";

console.log(`Meine Lieblingswort ist ${lieblingsWort}`);
```
2. Make the file executable:
```t
$ chmod +x lielingswort
```
3. Run the file from the local directory:
```t
$ ./lieblingswort
```
4. Or add the directory to your `PATH` and run the file globally: 
```t
$ export PATH="$PATH:/path/to/scripts"
$ lieblingswort
```
5. Get arguments passed to script
```bash
#!/usr/local/bin/node

console.log(`You have passsed ${process.argv.length} to this script.`);

for(let i = 0; i < process.argv.length; i++) {
    console.log(process.argv[i]);
}
```