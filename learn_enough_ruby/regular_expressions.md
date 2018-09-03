# Some Notes on Regular Expressions in Ruby

### A basic regex consists of a sequence of characters that matches a particular pattern.

## `match`
```ruby
zip_code = /\d{5}/

### ruby strings come with the match method
s = "Beverly Hills 90210"
puts "It's got a ZIP code!" if s.match(zip_code)
### or...
result = "Beverly Hills 90210".match(zip_code)
```

## `scan`
```ruby
### use scan to get an array of all matchers
s = "Beverly Hills 90210 was a '90s TV show set in Los Angeles."
s += " 91125 is another ZIP code in the Los Angeles area."
s.scan(zip_code)
### returns
["90210", "91125"]

all_caps = /[A-Z]{2,}/
```

## `split` on regex

### The regex for whitespace is `\s` 
### Indicate one or more with `+`
```ruby
"ant bat cat duck".split(/\s+/)
#returns
["ant", "bat", "cat", "duck"]
```