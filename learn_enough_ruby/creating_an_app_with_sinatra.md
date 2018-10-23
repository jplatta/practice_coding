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

16. Require the app for production in the `config.ru`:
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

20. Add functionality using the `nokogiri` gem to `test_helper.rb` to test for `html` content in your views:
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
  
  # ...other tests
end
```

22. Create a layout to remove redundant `html` code from the views: `$ touch views/layout.erb`. Layout needs to have include `<%= yield %>`
```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Learn Enough Ruby Sample App | <%= @title %></title>
        <link rel="stylesheet" type="text/css" href="/stylesheets/main.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    </head>
    <body>
        <a href="/" class="header-logo">
            <img src="/images/logo_b.png" alt="Learn Enough logo">
        </a>
        <div class="container">
            <%= erb :navigation %>
            <div class="content">
                <%= yield %>
            </div>
        </div>
    </body>
</html>
```

23. Pass content to a view using an i-var, e.g. to create dynamic page titles:
```ruby
get '/' do
  @title = 'Home'
  erb :index
end
```

```html
<title><%= @title %></title>
```

24. Create a partial for the links header: `$ touch views/navigation.erb` and include it in the `layout.erb`
#### including the navigation partial in the layout
```html
<%= erb :navigation %>
```

#### Navigation
```html
<header class="header">
    <nav>
        <ul class="header-nav">
            <li><a href="/">Home</a></li>
            <li><a href="/palindrome">Is It a Palindrome?</a></li>
            <li><a href="/about">About</a></li>
        </ul>
    </nav>
</header>
```

25. Require palindrome gem in app.
#### Update Gemfile
```ruby
source 'https://rubygems.org'

gem 'sinatra', '2.0.3'
gem 'rerun', '0.13.0'
gem 'jwplatta_palindrome'

group :test do
  gem 'minitest', '5.11.3'
  gem 'minitest-reporters', '1.2.0'
  gem 'rack-test', '1.0.0'
  gem 'rake', '12.3.1'
  gem 'nokogiri', '1.8.4'
end
```

#### use gem in app.rb
```ruby
# ...other requires...
require 'jwplatta_palindrome'

# ...rest of app.rb code...
```

26. Createa a form for submitting phrases to the palindrome checker:
#### The form in palindrome.erb
```html
<h1>Palindrome Detector</h1>

<form id="palindrome_tester" action="/check" method="post">
  <textarea name="phrase" rows="10" cols="60"></textarea>
  <br>
  <button class="form-submit" type="submit">Is it a palindrome?</button>
</form>
```

27. Create the `result.erb` to return the result: 
```html
<h1>Palindrome Result</h1>
<% if @phrase.palindrome? %>
    <div class="result result-success">
        <p>"<%= @phrase %>" is a palindrome!</p>
    </div>
<% else %>
    <div class="result result-fail">
        <p>"<%= @phrase %>" is not a palindrome.</p>
    </div>
<% end %>
```

28. Create a `post` request that checks if a phrase is a palindrome.
```ruby
require 'sinatra'
require 'rerun'
require 'jwplatta_palindrome'

# ...other routes...

post '/check' do
  @phrase = params[:phrase]
  erb :result
end

```

#### You can test the params using:
```ruby
# ...rest of app.rb code

post '/check' do
  raise params.inspect
end
```

29. Add some tests for the palindrome detector: `$ touch test/palindrome_test.rb`

30. Add the tests:
```ruby
require_relative 'test_helper'

class PalindromeAppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_form_presence
    get '/palindrome'
    assert doc(last_response).at_css('form')
  end

  def test_palindrome
    post '/check', phrase: 'racecar'
    assert_includes doc(last_response).at_css('p').text, "is a palindrome"
  end

  def test_not_palindrome
    post '/check', phrase: 'is not a palindrome'
    assert_includes doc(last_response).at_css('p').text, "is not a palindrome"
    assert doc(last_response).at_css('form')
  end
end
```

31. Refactor form into `views/palindrome_form.erb`
```html
<form id="palindrome_tester" action="/check" method="post">
  <textarea name="phrase" rows="10" cols="60"></textarea>
  <br>
  <button class="form-submit" type="submit">Is it a palindrome?</button>
</form>
```

#### adding the form as a partial
```
<%= erb :palindrome_form %>
```
