# Some Notes on the File Module

```ruby
text = File.read('phrases.txt')

text.split("\n").each do |line|
  if line.palindrome?
    puts "palindrome detected: #{line}"
  end
end

# readlines does not require the use of split
lines = File.readlines("phrases.txt")

lines.each do |line|
  if line.palindrome?
    puts "palindrome detected: #{line}"
  end
end


File.write(filename, content_string)

```