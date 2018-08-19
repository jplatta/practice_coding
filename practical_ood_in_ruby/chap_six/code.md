# Acquiring Behavior Through Inheritance

## Chapter 6 Code

#### Here's initial Bike class
```ruby
class Bicycle 
  attr_reader :size, :tape_color

  def initialize(args)
    @size       = args[:size]
    @tape_color = args[:tape_color]
  end

  def spares
    { chain:      '10-speed',
      tire_size:  '23', 
      tape_color: tape_color }
  end
end
```
#### But suppose you now need to account for road bikes and mountain bikes.

#### Below is an antipattern, i.e. what you don't want to do in this case. This version of Bicycle has more than one responsibility, contains things that might change for different reasons, and cannot be reused.
```ruby
class Bicycle 
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @style       = args[:style]
    @size        = args[:size]
    @tape_color  = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  def spares
    if style == :road
      { chain:      '10-speed',
        tire_size:  '23', 
        tape_color: tape_color }
    else
      { chain:      '10-speed',
        tire_size:  '2.1', 
        rear_shock: rear_shock }
    end
  end
end
```

#### The next example misapplies inheritance to the above problem.
#### Blindly inheriting from the Bicycle class means that MountainBike also inherits behavior that is specific to road bikes.

```ruby
class Bicycle 
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @style       = args[:style]
    @size        = args[:size]
    @tape_color  = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  def spares
    if style == :road
      { chain:      '10-speed',
        tire_size:  '23', 
        tape_color: tape_color }
    else
      { chain:      '10-speed',
        tire_size:  '2.1', 
        rear_shock: rear_shock }
    end
  end

  # Many other methods...
end
class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  #super here invokes the initialize method in the Bicycle class
  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  #super here invokes the spares method in the Bicycle class
  def spares
    super.merge({ rear_shock: rear_shock })
  end
end
```

####The next example starts to correclty apply inheritance. Begin by renaming the Bicycle class to the RoadBike class. 
```ruby
class Bicycle
end

class MountainBike < Bicycle
end

class RoadBike < Bicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @style       = args[:style]
    @size        = args[:size]
    @tape_color  = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  def spares
    if style == :road
      { chain:      '10-speed',
        tire_size:  '23', 
        tape_color: tape_color }
    else
      { chain:      '10-speed',
        tire_size:  '2.1', 
        rear_shock: rear_shock }
    end
  end
end
```
####Although the RoadBike class works, the MountainBike class is broken. Move behavior common to MountainBike and RoadBike into the Bicycle class. Start by promoting the size attribute to Bicycle. 
```ruby
class Bicycle
  attr_reader :size # promoted from Roadbike

  def initialize(args={})
    @size = args[:size]
  end
end

class MountainBike < Bicycle
end

class RoadBike < Bicycle
  attr_reader :style, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @style       = args[:style]
    @tape_color  = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    if style == :road
      { chain:      '10-speed',
        tire_size:  '23', 
        tape_color: tape_color }
    else
      { chain:      '10-speed',
        tire_size:  '2.1', 
        rear_shock: rear_shock }
    end
  end
end
```

#### Next promote `chain` and `tire_size`. (try to consolidate this code with above)
```ruby
class Bicycle
  attr_reader :size, :chain, :tire_size # promoted from Roadbike

  def initialize(args={})
    @size      = args[:size]
    @chain     = args[:chain]
    @tire_size = args[:tire_size]
  end
end

class MountainBike < Bicycle
  def spares
    super.merge({ rear_shock: rear_shock })
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @tape_color  = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    { chain:      '10-speed',
      tire_size:  '23',
      tape_color: tape_color }
  end
end
```
#### Next setup defaults by wrapping the values in methods. The `default_chain` is common to both subclasses and so is implemented in the Bicycle class. Use the template method and send a message to the subclass from the superclass for the `default_tire_size`. Following the _implement every template method_ rule of thumb, add `default_tire_size` to the Bicycle class and raise `NotImplementedError`, e.g. if someone implements RecumbentBike, that person will know to add `default_tire_size`.
```ruby
class Bicycle
  attr_reader :size, :chain, :tire_size # promoted from Roadbike

  def initialize(args={})
    @size      = args[:size]
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain # common default
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end
end

class MountainBike < Bicycle
  def spares
    super.merge({ rear_shock: rear_shock })
  end

  def default_tire_size
    '2.1'
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @tape_color  = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    { chain:      '10-speed',
      tire_size:  '23',
      tape_color: tape_color }
  end

  def defeault_tire_size
    '23'
  end
end

class Recumbentbike < Bicycle
  def defaut_chain 
    '9-speed'
  end
end
```
#### Promoting spares to Bicycle is difficult because it currently contains general and specialized values.
#### Add a `spares` method to Bicycle, update RoadBike `spares` to call super, and move remaining code specific to MountainBike out of RoadBike.
```ruby
class Bicycle
  attr_reader :size, :chain, :tire_size # promoted from Roadbike

  def initialize(args={})
    @size      = args[:size]
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain # common default
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def spares
    { tire_size: tire_size, 
      chain:     chain }
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end
  
  def spares
    super.merge({ rear_shock: rear_shock })
  end

  def default_tire_size
    '2.1'
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color  = args[:tape_color]
    super(args)
  end

  def spares
    super.merge({ tape_color: tape_color })
  end

  def defeault_tire_size
    '23'
  end
end
```
#### MountainBike and RoadBike currentky know how to interact with superclass which is indicated by the sends to `super` in `initialize` and `spares`. To further decouple the MountainBike and RoadBike from Bicycle, add the `post_initialize` and `local_spares` hook messages.
```ruby
class Bicycle
  attr_reader :size, :chain, :tire_size # promoted from Roadbike

  def initialize(args={})
    @size      = args[:size]
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def default_chain # common default
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def spares
  { tire_size: tire_size, 
    chain:     chain }.merge(local_spares)
  end

  def post_initialize(args)
    nil
  end

  def local_spares
    {}
  end
end

class MountainBike < Bicycle
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

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color  = args[:tape_color]
  end

  def local_spares
    { tape_color: tape_color }
  end

  def defeault_tire_size
    '23'
  end
end
```
#### With this final implementation of the class hierarchy, new subclasses, e.g. RucumbentBike, only need to implement the template methods.
```ruby
class RecumbentBike < Bicycle
  attr_reader :flag

  def post_initialize(args)
    @flag = args[:flag]
  end

  def local_spares
    { flag: flag }
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end
end
```