# Chap 8: Combining Objects with Composition

* `Struct` takes position order initialization arguemnts and `OpenStruct` takes a hash for its initialization.
* **Inheritance** _is-a_ relationships
    * Benefits: automatic message delegation
    * Costs: arranges object in a hierarchy which requires a set of embedded dependencies
* **Ducky Types** _behaves-like-a_ relationships
    * Benefits: create modules when (i) a role is not an object's main responsibility and (ii) the need for the role is widespread.
* **Composition** _has-a_ relationships
    * Benefits: allows object to have structural independence, object are small and have straightforward responsibilities
    * Cost: requires explicit message delegation, many short classes can to less transparent code