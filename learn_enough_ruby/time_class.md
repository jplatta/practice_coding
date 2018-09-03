# Some Examples Using Ruby's Built-in Time Class

```ruby

### new returns current time if no parameters supplied
now = Time.new
now = Time.now

now.year
now.hour

### month and day return unit-offset values
now.month
now.day

### generally want to use utc time
moon_landing = Time.utc(1969, 7, 20, "20:18")

###wday returns zero-offset values and follows the American convetion of starting the week on Sunday
moon_landing.wday
###returns 
0
```