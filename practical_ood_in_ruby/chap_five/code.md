# Reducing Costs with Duck Typing 

## Chapter 5 Code 

#### The code below is dependent-laden. Trip knows about the names of Mechanic, TripCoordiantor, and Driver classes. Trip knows what messages these other classes accept. Trip knows what arguments these messages require.

```ruby
class Trip 
  attr_reader :bicycles, :customers, :vehicle
  
  # this mechanic argument could be of any class
  def prepare(preparers)
    preparers.each do |preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver 
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    end
  end
end

# if passed an instance of the Mechanic class to the Trip.prepare method, it works
class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)
  end
end

class TripCoordinator
  def buy_food(customers)
  end
end

class Driver
  def gas_up(vehicle)
  end

  def fill_water_tank(vehicle)
  end
end
```

#### To remove these dependencies, implement the Preparer interface or duck type. Preparers are objects that implement the prepare_trip method. 

```ruby
class Trip 
  attr_reader :bicycles, :customers, :vehicle
  
  # this mechanic argument could be of any class
  def prepare(preparers)
    preparers.each { |preparer| preparer.prepare_trip(self) }
  end
end

# if passed an instance of the Mechanic class to the Trip.prepare method, it works
class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each do |bicycle|
      prepare_bicycle(bicycle)
    end
  end

  def prepare_bicycle(bicycle)
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  def buy_food(customers)
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end

  def gas_up(vehicle)
  end

  def fill_water_tank(vehicle)
  end
end
```