# Testing a Private Method (Chap 8)

## From test/jwplatta_palindrome.rb
#### Use the `send` method in order to route around the private restriction.

```ruby
require 'test_helper'

class JwplattaPalindromeTest < Minitest::Test

  #...other tests...

  def test_processed_content
    assert_equal "A man, a plan, a canal".send(:processed_content), "amanaplanacanal"
  end
end
```