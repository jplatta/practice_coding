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
    * A class with more than one responsibility to difficult to reuse
* Determing if a class has a single responsibility:
    * Rephrase each method into a question about the class. Does the question make sense?
        * *Mr. Class, what is your 'insert_method_name_here'?*
    * Try to describe the class in one sentence. If you need to use conjunctions, then the class likely doesn't have a single responsibility.
    * 