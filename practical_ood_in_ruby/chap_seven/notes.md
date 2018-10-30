# Chap Seven: Sharing Role Behavior with Modules

* A module allows a common role to be shared among unrelated objects.
* Duck types share code via Ruby modules.
* **Module** named group of methods that are independent of class and an be mixed in to any object.
* Just as for inheritance, if a module sends a message, e.g. `lead_days`, then it must implement the method.
* Modules also use the template method pattern and invite objects to provide specializations/overrides.
* The methods of the last include, i.e. the last module, are encountered first in the look up chain
* Extending a class with a module creates class methods in that class and extending an instance of a class with a module creates instance methods in that instance.
* Method lookup:
    1. Methods defined in this one instance of `ClassTwo`, i.e. `another_method`
    2. Methods defined in modules that this one instance of `ClassTwo` has been extended with, i.e. `module_six`
    3. Methods defined in `ClassTwo`
    4. Methods defined in `module_two`
    5. Methods defined in `module_one`
    6. Methods defined in `ClassOne`
    7. Methods defined in `module_four`
    8. Methods defined in `module_three`
    9. Methods defines in `Object`

```ruby
module module_one
  include module_five
end

 module module_six
 end

class ClassOne
  include module_three
  include module_four
end

class ClassTwo < ClassOne
 include module_one
 include module_two

 def instance_method
 end
end

foobar = ClassTwo()

def foobar.another_method
end

foobar.extend module_six
```

* Rules of thumb for writing inheritable code
    * Two anti-pattersn to avoid
        1. Your code has a variable with name like `type` or `category` to determine what message to send ot `self`.
        2. The sending object checks the class of the receiving object to determine what message to send.
    * Insist on the abstraction: a superclass should not contain code that apply to some, but not all of its subclasses.
    * Honor the contract: subclasses agree to be substitutable for their superclasses
        * **Liskov Substitution Principle** Let _q_(_x_) be a property provable about objects _x_ of type _T_. Then _q_(_y_) should be true for objects _y_ of type _S_ where _S_ is a subtype of _T_.
    * Use the template method pattern
    * Preemptively decouple classes: avoid writing code that sends `super`. Use hook messages instead.
    * Create shallow hierarchies