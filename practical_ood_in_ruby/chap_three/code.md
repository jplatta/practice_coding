# Managing Dependencies 

## Chapter 3 Code

### Gear class is slighlty modified from chapter 2

#### This code is problematic because 
#### 1. Gear expects a class named Wheel to exist
#### 2. Gear expects Wheel to respond to diameter
#### 3. Gear knows a new Wheel requires rim and tire
#### 4. Gear know sthe first argument for a new Wheel should be rim and the second tire
```ruby
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring  = chainring
    @cog        = cog
    @rim        = rim
    @tire       = tire
  end

  def ratio 
    chainring / cog.to_f
  end

  def gear_inches 
    ratio * Wheel.new(rim, tire).diameter
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim 
    @tire = tire
  end

  def diameter
    rim + (tire * 2) 
  end

  def circumference
    diameter * Math::PI
  end
end
```
#### Inject the Wheel class into the Gear class so that Gear can use other objects with a diameter method, e.g. disks or cylinders
```ruby
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring  = chainring
    @cog        = cog
    @wheel      = wheel
  end

  def ratio 
    chainring / cog.to_f
  end

  def gear_inches 
    ratio * wheel.diameter
  end
end
```
#### Alternatively, isolate the creation of the Wheel inside the Gear class. It's always better to inject dependencies when able.
```ruby
### Example 1
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, rim, tire)
    @chainring  = chainring
    @cog        = cog
    @wheel      = Wheel.new(rim, tire)
  end

  def ratio 
    chainring / cog.to_f
  end

  def gear_inches 
    ratio * wheel.diameter
  end
end

### Example 2
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring  = chainring
    @cog        = cog
    @rim        = rim
    @tire       = tire
  end

  def ratio 
    chainring / cog.to_f
  end

  def gear_inches 
    ratio * wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end
end
```
#### Isolate vulnerable external messages: move the message sent to Wheel for diameter to a method in Gear
```ruby
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, rim, tire)
    @chainring  = chainring
    @cog        = cog
    @wheel      = Wheel.new(rim, tire)
  end

  def ratio 
    chainring / cog.to_f
  end

  def gear_inches 
    ratio * diameter
  end

  def diameter
    wheel.diameter
  end
end
```
#### Avoid depending on fixed-order arguments by removing argument-order dependency, e.g. use hashes for initialization arguments
```ruby
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring  = args[:chainring]
    @cog        = args[:cog]
    @wheel      = args[:wheel]
  end

  def ratio 
    chainring / cog.to_f
  end

  def gear_inches 
    ratio * wheel.diameter
  end
end
```

#### Explicitly define defaults (3 methods)
```ruby
### Method 1
# specify defaults using ||
# do not use if args[:key] returns a boolean thing
class Gear
  def initialize(args)
    @chainring = args[:chainring] || 40
    @cog       = args[:cog] || 18
    @wheel     = args[:wheel]
  end
end

### Method 2
# specify defaults using fetch
# fetch allows you to set defaults
class Gear
  def initialize(args)
    @chainring = args.fetch(:chainring, 40)
    @cog       = args.fetch(:cog, 18)
    @wheel     = args[:wheel]
  end
end

### Method 3
# specify defaults using a hash
# hash also allows you to set defaults
class Gear
  def initialize(args)
    args       = defaults.merge(args)
    @chainring = args[:chainring]
  end

  def defaults
    { :chainring => 40, :cog => 18 }
  end
end
```
#### If the initialization of an object requires fixed-order arguments (i.e. you do not control the interface of the class), then use a wrapping method to isolate external dependencies.
```ruby
# Assumes Gear is a part of an external interface that you do not control
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog       = cog 
      @wheel     = wheel
    end
  end
end

# Protect your code from changes by wrapping the interface in a method
module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring], 
                            args[:cog], 
                            args[:wheel])
  end
end
```

