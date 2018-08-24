# Chap 8: Combining Objects with Composition

* `Struct` takes position order initialization arguemnts and `OpenStruct` takes a hash for its initialization.
* Inheritance: _is-a_ relationships
    * Benefits: automatic message delegation
    * Costs: arranges object in a hierarchy which requires a set of embedded dependencies
* Ducky Types: _behaves-like-a_ relationships
* Composition: _has-a_ relationships
    * Benefits: allows object to have structural independence
    * Cost: requires explicit message delegation