# Create Sample Gem

Helpful links: [gem structure](https://guides.rubygems.org/what-is-a-gem/) and [creating a gem](https://guides.rubygems.org/make-your-own-gem/)

## Notes
* lib folder contains the code
* test or spec folder has the tests
* bin directory contains executable file that gets loaded in the a user's PATH when the gem is installed
* gemspec contains info about the gem

## Basic steps for creating a gem 
1. Create the gemspec at the root: gem_name.gemspec 
2. Create teh lib folder
3. In the lib folder create teh ruby file: gem_name.rb
4. Edit the gemspec with details about the gem
5. Build the gem: `gem build gem_name.gemspec`
6. Install the gem: `gem install gem_name-0.0.0.gem`
7. Require gem: `require 'gem_name'`
8. Start using gem