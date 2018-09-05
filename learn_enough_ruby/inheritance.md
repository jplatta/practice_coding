# Inheritance

```ruby
s = String.new("foobar")
#returns => "foobar"

s.class # Find the class of s.
#returns => String

s.class.superclass # Find the superclass of String.
#returns =>Object

s.class.superclass.superclass # Ruby has a BasicObject base class as of 1.9
# returns => BasicObject

s.class.superclass.superclass.superclass
#returns => nil
```