# Chapter 2: Designing Classes with a Single Responsibility

* Defining easy to change code: 
    * Changes have no unexpected side effects
    * Small changes in requirements require small changes in code
    * Existing code is easy to reuse
    * The easiest way to make a change is to add code that is also easy to change
* TRUE code:
    * **T**ransparent: The consequences of change should be obvious in the code that is changing and in distant code that relies upon it 
    * **R**easonable: The cost of change should be proportional to the benefits of the change
    * **U**sable: Existing code should be usable in new and unexpected contexts
    * **E**xemplary: The code itself should encourage those who chnge it to perpetuate these qualities.
* Applications that are easy to change consist of classes that are easy to reuse.
    * A resuable class is *(1)* a pluggable unit of code of *(2)* well-defined behavior that has *(3)* few entanglements.
    * A class with more than one responsibility is difficult to reuse
* Determing if a class has a single responsibility (SRP):
    * Rephrase each method into a question about the class. Does the question make sense?
        * *Mr. Class, what is your 'insert_method_name_here'?*
        * Miss. WheelClass, what is your diameter?
    * Try to describe the class in one sentence. If you need to use conjunctions, then the class likely doesn't have a single responsibility.
* In general, when the future cost of doing nothing is the same as the current cost, then postpone the decision.
* Behavior is captured in methods and evoked by sending messages.
* The initial implementation of the Gear class is neither usable nor exemplary because it has multiple responsibilites. Moreover, if the Gear class acquired dependencies it would also be neither transparent nor reasonable because it would conceal these dependencies.
* **Rules of thumb** for writing code that embraces change: 
    * *Hide instance variables*, i.e. wrap i-vars in accessor methods. 
        * If @cog is referred to a bunch of times and changes, then code will need to be refactored in many places. But if the cog method is the only thing that understand what cog means, then the cog method is the only thing that needs refactoring.
        ```ruby
        # BAD
        class Gear
            def initialize(chainring, cog)
              @chainring = chainring
              @cog = cog
            end

            def ratio
              @chainring / @cog.to_f
            end
        end

        # GOOD
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
    * *Hide data structures*
        * The diameter method in ObscuringReferences depends on knowing rims are at index 0 and tires are at 1. If the structure changes, then the code must change. In short, diameter _depends_ on the arrays structure. The knowledge that rims are at 0 should be known in one place. 
        * You can use the Ruby Struct class to wrap a structure
        * The diameters method in RevealingReferences has now knowledge of the structure of the array. These references have been transformed into messages to rim and tire. The knowledge of the structure of the array has been isolated in wheelify.
        * **Struct** provides a way to bundle a number of attributes together, using accessor methods, without having to write an explicit class.
        ```ruby
        # BAD
        class ObscuringReferences
          attr_reader :data
          def initialize(data)
            @data = data
          end

          def diameters
            data.collect do |cell|
              cell[0] + (cell[1] * 2)
            end
          end
        end

        # GOOD
        class RevealingReferences
          attr_reader :wheels
          def initialize(data)
            @wheels = wheelify(data)
          end

          def diameters
            wheels.collect do 
              wheel.rim + (wheel.tire * 2)
            end  
          end

          Wheel = Struct.new(:rim, :tire)

          def wheelify(data)
            data.collect do |cell|
              Wheel.new(cell[0], cell[1])
            end
          end
        end
        ```
    * Enforce single responsibility everywhere
        * *Extract extra responsibilities from methods*: 
            * Example 2 reveals that Gear is responsible for calculating gear_inches but should not be calculating wheel diameter.
            * Methods with a single responsibility: 
                1. Expose previously hidden qualities
                2. Avoid the need for comments
                3. Encourage reuse
                4. Are easy to move to another class
        ```ruby
        ## Example 1
        # BAD
        def diameters
          wheels.collect do |wheel|
            wheel.rim + (wheel.tire * 2)
          end
        end
        # GOOD
        def diameters
          wheels.collect do |wheel|
            diameter(wheel)
          end
        end

        def diameter(wheel)
          wheel.rim + (wheel.tire * 2)
        end

        ##Example 2
        # BAD 
        def gear_inches
          ratio * (rim + (tire * 2))
        end

        # GOOD
        def gear_inches
          ratio * diameter
        end

        def diameter
          rim * (tire * 2)
        end
        ```
        * *Isolate extra responsibilities of classes*
            * Use Struct to remove the responsibility for calculating tire diameter from Gear without committing to a new class.
            * The wheel Struct can be expanded into a full blown class if needed, e.g. the addition of a method to calculate the circumference of the wheel.
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