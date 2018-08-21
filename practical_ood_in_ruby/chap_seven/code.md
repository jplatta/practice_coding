# Sharing Role Behavior with Modules

## Chapter 7 Code

#### Initial implementation of scheduling bikes for a trip
#### This code hides knowledge of scheduling behind bicycle.
```ruby
class Schedule 
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class} " + 
         "is not scheduled\n" +
         " between #{start_date} and #{end_date}"
    false
  end
end

class Bicycle
  attr_reader :schedule, :size, :chain, :tire_size

  #Inject the Schedule and provide a default
  def initialize(args={})
    @schedule = args[:schedule] || Schedule.new
    #...other init code goes here
  end

  # Return true if this bicycle is available
  # during this (no Bicycle specific) interval
  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  #Return the schedule's answer
  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  #Return the number of lead_days before bicycle can be scheduled.
  def lead_days
    1
  end

  #...other bicycle code goes here
end
```
#### Mechanics and vehicles are also schedulable. So, the above code needs to be rearranged to share
#### the scheduleable functionality with other objects. The below code moves the schedulable functionality
#### into a module. Bicycle, Vehicle, and Mechanic all play the Schedulable role.
```ruby
class Schedule 
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class} " + 
         "is not scheduled\n" +
         " between #{start_date} and #{end_date}"
    false
  end
end

module Schedulable
  attr_writer :schedule
  
  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  #Includes may override
  def lead_days
    0
  end
end

class Bicycle
  attr_reader :size, :chain, :tire_size

  include Schedulable

  #Inject the Schedule and provide a default
  def initialize(args={})
    @schedule = args[:schedule] || Schedule.new
    #...other init code goes here
  end

  def lead_days
    1
  end

  #...other bicycle code goes here
end

class Vehicle
  include Schedulable

  def lead_days
    3
  end
end

class Mechanic
  include Schedulable

  def lead_days
    4
  end
end
```