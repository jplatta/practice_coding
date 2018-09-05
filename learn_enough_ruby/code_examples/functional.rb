states = ["Kansas", "Nebraska", "North Dakota", "South Dakota"]

# Returns a URL-friendly version of a string.
# Example: "North Dakota" -> "north-dakota"
def urlify(string)
    string.downcase.split.join('-')
end

# urls: Imperative version
def imperative_urls(states)
  urls = []
  states.each do |state|
    urls << urlify(state)
  end  
  urls
end

puts imperative_urls(states).inspect

# urls: Functional version
def functional_urls(states)
  states.map { |state| urlify(state) }
end

puts functional_urls(states).inspect

# singles: Imperative version
def imperative_singles(states)
  singles = []
  states.each do |state|
    if (state.split(/\s+/).length == 1)
      singles.push(state)
    end
  end
  
  singles
end

puts imperative_singles(states).inspect

# singles: Functional version
def functional_singles(states)
  states.select { |state| state.split.length == 1 }
end

puts functional_singles(states).inspect

### Reduce Example 1: sum integers

numbers = (1..10)
# reduce: Iterative solution
def iterative_sum(numbers)
  total = 0
  numbers.each do |n|
    total += n
  end
  
  return total
end

puts iterative_sum(numbers)

# reduce: Functional solution
def functional_sum(numbers)
  numbers.reduce { |total, n| total += n }
end

puts functional_sum(numbers)

### Reduce Example 2
# lengths: Imperative solution
def imperative_lengths(states)
  lengths = {}
  
  states.each do |state|
    lengths[state] = state.length
  end
  
  return lengths
end

puts imperative_lengths(states)

# lengths: Functional solution
def functional_lengths(states)
  states.reduce({}) do |lengths, state|
    lengths[state] = state.length
    lengths
  end
end

puts functional_lengths(states)