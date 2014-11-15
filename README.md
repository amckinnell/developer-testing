Developer Testing
=================

Sample code that illustrates three advanced developer testing techniques as they apply to the [Gilded Rose Kata](http://craftsmanship.sv.cmu.edu/exercises/gilded-rose-kata).

The three testing techniques are:
* [Characterization Testing](http://www.artima.com/weblogs/viewpost.jsp?thread=198296)
* [Mutation Testing](http://github.com/mbj/mutant)
* [Approval Testing](http://github.com/kytrinyx/approvals)


Refactoring Practice
--------------------

To practice your own refactoring supported by a hash-based characterization test:

`git checkout tags/ready_to_refactor -b practice_characterization`

To practice your own refactoring supported by an approval test:

`git checkout tags/ready_to_add_conjured_item -b practice_approval`


My Refactoring
--------------

If you want to follow along with how I chose to perform the refactoring you can see each stage in a separate branch:

  1. `git checkout preparatory_refactoring`
  2. `git checkout item_adaptor_refactoring`
  3. `git checkout replace_case_with_polymorphism`


Recommended Reading
-------------------

Michael Feathers  
[Working Effectively with Legacy Code](http://www.informit.com/store/working-effectively-with-legacy-code-9780131177055)

Gerard Mezsaros  
[xUnit Test Patterns](http://www.informit.com/store/xunit-test-patterns-refactoring-test-code-9780131495050)

Nat Pryce  
[Can Approval Testing and Specification by Example Work Together?](http://www.natpryce.com/articles/000801.html)

Emily Bache    
[The Coding Dojo Handbook](https://leanpub.com/codingdojohandbook)

Martin Fowler  
[Workflows of Refactoring](http://martinfowler.com/articles/workflowsOfRefactoring/)
