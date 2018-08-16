# Chap 3: Managing Dependencies

* For objects to collaborate, they must know something about each other. This "knowing about each other" creates dependencies. 
* *An Object has a dependency when it knows:*
    1. The name of another class
        * Problematic because:
            1. If the name of class X changes, then code of any class that references X by name must change.
            2. If class Y depends on class X for method Z and Y references X by name, them Y cannot use any other implementation of method Z in classes other than X, e.g. the method diameter method in the Wheel class.
    
    2. The name of a message it intends to send to someone other than self
        * Problematic because: 
    3. The arguments that a message requires
        * Problematic because: 
    4. The order of the arguments of a message
        * Problematic because: 
* Dependencies create the chance that if one object changes, then another must change
* Some dependencies are unavoidable. _Goal is for each object to have the fewest possible dependencies_.
* Inject Dependencies
* Isolate Dependencies
    * Isolate Instance Creation
    * Isolate Vulnerable External Messages
* Remove Argument-Order Dependency
* Choose Dependency Direction
    * Some simple truths about code:
        1. Some classes are more likely to have changes in requirements
        2. Concrete classes are more likely to change than abstract classes
        3. Changing a class taht has many dependents will result in widespread consequences
    * Depending on an abstraction is always safer than depending on a concretion
    * Classes that have many dependents are under pressure to not change
    * Depend on things that change the least often

Dependents     | Less Likely to Change | More Likely to Change
---------------|-----------------------|----------------------
Many Dependents| Absract Zone          | Danger Zone
Few Dependents | Neutral Zone          | Neutral Zone
