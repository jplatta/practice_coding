# Steps for Creating a New Gem

1. `$ bundle gem gem_name`
    * This creates the skeleton with all the necessary gem files. 
2. Update the `gemspec` file
    * Add summary, description, and homepage
3. Update the `Gemfile`
    * `gem 'minitest-reporters', '1.2.0'`
    * `gem 'rspec'`
4. Require testing gem in `test/test_helper.rb`
    * `require rspec`
5. Run `bundle install` from the root folder.
6. Run the test suite (for minitest): `$ bundle exec rake`
7. Install the gem locally (run from root folder of gem): `$ bundle exec rake install`
8. Test the gem locally with `irb`
    * `>> require 'gem_name'`
9. Make the gem public: `$ bundle exec rake release`
10. Uninstall gem locally: `$ gem uninstall gem_name`
11. Install gem from the web: `$ gem install gem_name -v 0.0.0`