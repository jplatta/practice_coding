# Create Hello World Sinatra App

1. Check if sinatra is installed `$ gem list | grep sinatra`
2. Install sinatra gem if it's not installed, i.e. `$ gem install sinatra`
3. Create a `hello_world_app.rb` file
4. Require sinatra and createa  couple of get requests:
```ruby
require 'sinatra'

get "/wie-gehen-sie?" do
  'Es geht sehr gut!'
end

### Root URL
get '/' do 
  'Guten Tag Welt!'
end
```

5. Run the `hello_world_app.rb` app with ruby, i.e. `$ ruby hello_world_app.rb`