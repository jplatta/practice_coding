# Chap Six: Acquiring Behavior Through Inheritance

* Classical inheritance is essentially a mechanism for automatic message delegation.
* Antipattern: using an `if` statement to check an attribute that holds the category of self to determine what message to send to self, e.g. the spares method in chapter six
    * This antipattern will sometimes indicate a missing subtype.
* The problem inheritance solves: that of highly related types that share common behavior but differ along some dimension.
* **Inheritance** is a way of defining two objects as having a relationship such that when the first receives a message that it does not understand, it automatically forwards, or delegates, the mssage to the second. 
* **Single Inheritance** a subclass is allowed only one parent superclass.
    * Ruby is a single inheritance language
* If you do not explicitly specify the superclass of a new class, then Ruby sets the superclass to `Object`
* Sending `super` in any method passes that messages up the superclass chain (115).
* Subclasses should include all the behavior of their superclasses plus some specialized behavior.
* **Abstract classes** are meant to be subclassed and not instantiated.
* In general it's easier to promote code subclass -> superclass rather than superclass -> subclasses
    * Promote to abstractions rather than demoting to concretions.
* **Template Method Pattern** The technique of defining a basic structure in the superclass and sending messages to acquire subclass-specific contributions.
    * Rule of thumb: _implement every template method in the the superclass_ even if only to raise an error.
    * Code examples: `default_tire_size`
* Decouple subclasses from superclasses using **hook messages**
    * **Hook messages** are messages sent by superclasses to subclasses so that subclasses can contribute information by implementing matching methods.
    * Code examples" `post_initialize` and `local_spares`
* _Rule of Thumb_ Don't create a class hierarchy if you expect less than three subclass types.


