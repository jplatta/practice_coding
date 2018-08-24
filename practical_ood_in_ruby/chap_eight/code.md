# Combining Objects with Composition

## Chapter 8 Code

#### Begin converting Bicycle to use composition with a new class Parts.
#### This code isn't super different from the Bicycle heirarchy in chap 6. The main difference is the introduction of the Parts class. 
```ruby
class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size  = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

class Parts
  attr_reader :chain, :tire_size

  def initialize(args={})
    @chain     = args[:chain]  || default_chain 
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def spares
    { tire_size: tire_size, 
      chain:     chain }.merge(local_spares)
  end

  def default_tire_size
    raise NotImplementedError
  end

  #subclasses may override
  def post_initialize(args)
    nil
  end

  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end
end

class RoadBikeParts < Parts
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    {tape_color: tape_color}
  end

  def default_tire_size
    '23'
  end
end

class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  def local_spares
    { rear_shock: rear_shock }
  end

  def default_tire_size
    '2.1'
  end
end
```
#### Introduce a `Part` class to the above.
```ruby
class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size  = args[:size]
    @parts = args[:parts]
  end

  def spares 
    parts.spares
  end
end

class Parts
  attre_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select { |part| part.needs_spare }
  end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name        = args[:name]
    @description = args[:description]
    @needs_spare = args[:needs_spare, true]
  end
end
```
#### The `parts` and `spares` methods of Bicycle should both return an array. Two possibilities for getting `Parts` to behave like an array are below. Both of these possibilities return unexpected behavior.
```ruby
### Example 1
### Create a size method
class Parts < Array
  attre_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select { |part| part.needs_spare }
  end

  def size 
    parts.size
  end
end

### Example 2
### Have Parts inherit from Array
class Parts < Array
  attre_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select { |part| part.needs_spare }
  end
end
```
#### Instead of the above two examples, have teh `Parts` class delegate `size` and `each` to its `@parts` array and includes `Enumerable`.
```ruby
require `forwardable`
class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable

  def initialize(parts)
    @parts = parts
  end

  def spares
    select { |part| part.needs_spare }
  end
end
```
#### Isolate the knowledge needed to create `Parts` inside a `PartsFactory`
```ruby
module PartsFactory
  def self.build(config, part_class = Part, parts_class = Parts)
    
    parts_class.new(
      config.collect do |part_config| 
        part_class.new(name: part_config[0], 
                       description: part_config[1], 
                       needs_spare: part_config.fetch(2, true))  
      end
    )

  end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name        = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end
end
```
#### Remove the `Part` class to simplify the code.
```ruby
module PartsFactory
  def self.build(config, parts_class = Parts) 
    parts_class.new(
      config.collect { |part_config| create_part (part_config) }
    )
  end

  def self.create_part(part_config)
    OpenStruct.new(
        name: part_config[0],
        description: part_config[1],
        needs_spare: part_config.fetch(2, true)
    )
  end
end
```
#### The complete code for Bicycle using composition. 
```ruby
class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size  = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

require 'forwardable'
class Parts
  extend Forwardable
  def delegators :@parts, :size, :each
  include Enumerable

  def initialize(parts)
    @parts = parts  
  end

  def spares
  select { |part| part.needs_spare }
  end
end

require 'ostruct'
module PartsFactory
  def self.build(config, parts_class = Parts) 
    parts_class.new(
      config.collect { |part_config| create_part (part_config) }
    )
  end

  def self.create_part(part_config)
    OpenStruct.new(
        name: part_config[0],
        description: part_config[1],
        needs_spare: part_config.fetch(2, true)
    )
  end
end
```
