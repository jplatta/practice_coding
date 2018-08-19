# Chap Five: Reducing Costs with Duck Typing

* **Duck Type** Duck types are public interfaces taht are not tide to any specific class.
* Across-class tpyes, duck types, have a public interfaces that represent a contract that must be explicit and well documented. 
* Class A's xya_method sends a message to Class B.
* Abstract code may be more difficult to understand, but once understood is far easier to change.
* **Polymorphism** Polymorphism refers to the ability of objects of different classes to respond to the same message, e.g. the prepare_trip method in chapter five. There are many ways to create polymorphic classes, e.g. duck typing, class inheritance, mixins, etc.
* Discovering when to create a duck type:
    * Hidden ducks:
        * Case statements that switch on class
        * `kind_of?` and `is_a?`
        * `responds_to?`
    * If introducing a duck type would require monkey patching, generally skip the duck type.
* Comparison of dynamic and static typing (100-104)
