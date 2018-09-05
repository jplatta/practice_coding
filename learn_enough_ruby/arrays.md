# Some Incomplete Notes on Arrays

### `split`

#### Split with no args splits on whitespace
```ruby

'The bear bumbled below.'.split

### returns
["The","bear","bumbled","below."]
```

#### Split can divide a string into its components characters
```ruby
'bear'.split('') 

### returns
['b','e','a','r']
```

### `slice`

#### returns array from index_one to index_two
```ruby
[2,7,4,62,1].slice(2,4)

###returns
[4,62,1]
```

#### you can slice with a range
```ruby
[2,7,4,62,1].slice(2..4)

###returns
[4,62,1]
```

#### you can slice using bracket notations
```ruby
###most common way to slice in ruby
[2,7,4,62,1].slice[2..4]

###returns
[4,62,1]

[2,7,4,62,1].slice[2,4]

###returns
[4,62,1]
```

### `to_a`

#### Convert a range to an array
```ruby
(1..4).to_a

###returns
[1,2,3,4]
```

### Other Array `methods`

#### `sort`, `reverse`, `push`, `pop`, `join`

Notes
* `push` returns the length of the new array.
* `<<` is called the "shovel operator".

### Looping through an array

```ruby
an_array.each do |element|
  puts element
end
```
