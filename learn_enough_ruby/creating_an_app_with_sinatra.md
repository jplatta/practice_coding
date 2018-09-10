# Steps for Creating an App with Sinatra

1. Make a new directory: `$ mkdir palindrome_app`

2. Make a file for the app to live in: `$ touch app.rb`

3. Create a Gemfile: `$ touch Gemfile`

4. Add the following to your `Gemfile`:
```ruby
source 'https://rubygems.org'

gem 'sinatra', '2.0.3'
gem 'rerun', '0.13.0'
```

5. Run `$ bundle install`

6. Add root route to your `app.rb` file:
```ruby
require 'sinatra'

get '/' do
  'hello, world!'
end
```

7. Start the app up using `rerun` which allows you to see changes without having to restart the server: `$ bundle exec rerun app.rb`

8. Add some additional routes with views:
```ruby
require 'sinatra'
require 'rerun'

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/palindrome' do
  erb :palindrome
end
```

9. Create a `views` directory in the root directory of the app: `$ mkdir views`

10. Creat the following erb templates: `$ touch views/index.erb views/about.erb views/palindrome.erb`

11. For images and stylesheets, create a `public` directory in the root folder of the app: `$ mkdir public`
    * Then make an `images` directory: `$ mkdir public/images`
    * Then make a `stylesheets` directory: `$ mkdir public/stylesheets`

12. Add automated testing to your app. First update your `Gemfile`:
```ruby
group :test do
  gem 'minitest', '5.11.3'
  gem 'minitest-reporters', '1.2.0'
  gem 'rack-test', '1.0.0'
  gem 'rake', '12.3.1'
  gem 'nokogiri', '1.8.4'
end
```
13. Next create `test` directory in the root directory of the app: `$ mkdir test`
14. Then create the test files:  `$ touch test/test_helper.rb test/site_pages_test.rb`
15. The `test_helper.rb` needs to require all the necessary gems and the app:
```ruby
ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'rack/test'
require 'nokogiri'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
```

16. Now you need a `Rakefile` in the root directory of the app: `$ touch Rakefile`

16. Add a Rake config file for production as well: `$ touch config.ru`

16. Require the aoo for production in the `config.ru`:
```ruby
require './app'

run Sinatra::Application
```

17. Setup the `Rakefile` to run the tests:
```ruby
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'test/*_test.rb'
  t.warning = false
end

task :default => [:test]
```

18. Add some basic tests to `site_pages_test.rb`:
```ruby
require_relative 'test_helper'

class PalindromeAppTest < Minitest::Test
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

  def test_index
    get '/' 
    assert last_response.ok?
  end
  
  def test_about
    get '/about'
    assert last_response.ok?
  end
  
  def test_palindrome_page
    get '/palindrome'
    assert last_response.ok?
  end
end
```

19. Run the tests: `$ bundle exec rake test`

20. Add functionality to `test_helper.rb` to test for `html` content in your views:
```ruby
### test/test_helper.rb
ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'rack/test'
require 'nokogiri'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

# Returns the document.
def doc(response)
  Nokogiri::HTML(response.body)
end
```

21. Add some simple tests to check for a `<h1>` tag.
```ruby
### test/site_pages_test.rb
require_relative 'test_helper'
class PalindromeAppTest < Minitest::Test
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
    assert doc(last_response).at_css('h1')
  end
  
  def test_about
    get '/about'
    assert last_response.ok?
    assert doc(last_response).at_css('h1')
  end

  def test_palindrome_page
    get '/palindrome'
    assert last_response.ok?
    assert doc(last_response).at_css('h1')
  end
end
```

22. Create a layout to remove redundant `html` code from the views.