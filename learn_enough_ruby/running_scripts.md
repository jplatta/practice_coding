## Writing Scripts

[Write an Executable Script](https://www.learnenough.com/text-editor-tutorial#sec-writing_an_executable_script)

#### Ruby Scripts 

* Add `#!/usr/bin/env ruby` to the top of the file
* File should have no extension, e.g. `hello` 
* Make the file executable `$ chmod +x hello`
* Run the file from the local directory `$ ./hello`
* Add the directory your `PATH` to run the file globally:
    * Add the following to your bash profile: `$ export PATH="$PATH:/path/to/dir"`
* Hello world exammple:  

```bash
#!/usr/bin/env ruby

puts 'Guten Tag Welt!'
```