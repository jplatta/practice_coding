# Chap 4: Creating Flexible Interfaces

* An object-oriented application is made up of classes but defined by messages. 
* Public interface of a class consists of those methods in the classes intended for use by others
* Public Interfaces:
    * Reveal a class's primary responsibility
    * Are expected to be invoked by others
    * Will not change on a whim
    * Are safe for others to depend on
    * Are thoroughly documented in the tests
* Private Interfaces: 
    * Handle implementation details
    * Are not expected to be sent by other objects
    * Can change for any reason
    * Are unsafe for others to depend on
    * May not even be referenced in the tests
* _what_ versus _how_
* The things that class A knows about class B makes up class A's context:
    * _The best possible situation is for an object to be completely independent of its context. An object that could collaborate with others without knowing who they are or what they do could be reused in nvel and unanticipated ways._
* Context independence requires class A to invoke class B's behavior without knowing what class B does.

**Rules of Thumb for Creating Interfaces**
* Create explicit interfaces: 
    * Should be explicitly identified as such
    * Should be more about _what_ than _how_
    * Should have names that don't change
    * Should take a hash as an options parameter
* Honor the public interfaces of others, i.e. only use the public methods of other classes
* If absolutely must use a private method from another class, then...
    * Minimize context, e.g. create a wrapper method or class for that private method that you can safely consume inside your class
* Law of Demeter
    * Forbids sending a message to a third object via a second objet of a different type, viz. "use only one dot"
    * _Train wrecks_ is a message chain containing a number of a dots
