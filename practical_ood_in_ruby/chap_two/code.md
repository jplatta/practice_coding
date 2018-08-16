# Designing Classes with a Single Responsibility

## Chapter 2 Code

### Create a simple gear class for the ruby script with gear data
```ruby
class Gear
  attr_reader :chainring, :cog
  
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end
end
```

### Add method for gear inches for comparing bicycles
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
    ratio * (rim  + (tire * 2))
  end
end
```

### Isolate responsibilities of methods: Add a diameter method
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
    ratio * diameter
  end

  def diameter
    rim + (tire * 2)
  end
end
```

### Isolate responsibilities of classes: Move the diameter method into a wheel Struct
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
    ratio * wheel.diameter
  end

  Wheel = Struct.new(:rim, :tire) do 
    def diameter
      rim + (tire * 2)
    end
  end
end
```

### Create a Wheel class and include a method for wheel circumference
```ruby
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil)
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
