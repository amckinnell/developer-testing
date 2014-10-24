Gilded Rose Kata Refactoring Workshop
=====================================

This repo contains an exercise for our refactoring workshop. A big debt of gratitude is due to Alistair McKinnell for presenting the Gilded Rose Kata and his characterization tests at the last Toronto Ruby Brigade session. We knew immediately that his work would provide an excellent basis for refactoring, and this drove us to (finally!) actually organize it.

Alistair's repo (which we've forked here) was built to demonstrate "three advanced developer testing techniques as they apply to the [Gilded Rose Kata](http://craftsmanship.sv.cmu.edu/exercises/gilded-rose-kata)."  You can learn more about those techniques in the parent repo.

We've restructured the repo to provide a quick-start introduction to refactoring techniques by replacing the refactored Gilded Rose Kata code with the original kruft (translated into Ruby by professor - check it out here: https://github.com/professor/GildedRose), but retaining the awesome characterization tests Alistair built.

Your mission is the same as in the original Gilded Rose Kata, but if you find it a bit to easy, we've added some stretch goals too.  Have fun!


##Setup

Here are the steps to get you started with the repo. We assume, naturally, that you have a working development machine with Ruby 1.8 or better on it. At Ryatta Group we use rbenv, and so we've included some optional elements - just skip them if you're using rvm or are not versioning your Ruby.

```sh
% git clone git@github.com:k00ka/developer-testing.git
Cloning into 'developer-testing'...
remote: Counting objects: 212, done.
remote: Compressing objects: 100% (107/107), done.
remote: Total 212 (delta 103), reused 211 (delta 102)
Receiving objects: 100% (212/212), 23.71 KiB | 0 bytes/s, done.
Resolving deltas: 100% (103/103), done.
Checking connectivity... done.
% cd developer-testing
% gem install bundler
Fetching: bundler-1.7.4.gem ( 13%)^R
Fetching: bundler-1.7.4.gem ( 68%)t
Fetching: bundler-1.7.4.gem (100%)
Successfully installed bundler-1.7.4
1 gem installed
% bundle
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Installing rake 10.3.2
    ...
Installing simplecov 0.9.1
Using bundler 1.7.4
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```
######Note: if you use rbenv...
```sh
% rbenv rehash
```

Running the tests
-----------------
######Run the characterization test 
```sh
% rspec ./spec/gilded_rose_characterization_spec.rb
.

Finished in 0.00169 seconds
1 example, 0 failures
```
######Run approvals to see the differences between expected and actual test results
```sh
% approvals verify
```


## Rules and Specification
Your mission is the same as in the original Gilded Rose Kata, but if you find it a bit to easy, we've added some stretch goals too. Have fun!

Hi and welcome to team Gilded Rose.

As you know, we are a small inn with a prime location in a prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date.

We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items.

First an introduction to our system:

* All items have a SellIn value which denotes the number of days we have to sell the item

* All items have a Quality value which denotes how valuable the item is

* At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

* Once the sell by date has passed, Quality degrades twice as fast

* The Quality of an item is never negative

* "Aged Brie" actually increases in Quality the older it gets

* The Quality of an item is never more than 50

* "Sulfuras", being a legendary item, never has to be sold or decreases in Quality

* "Backstage passes", like aged brie, increases in Quality as it's SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover for you).

* Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a legendary item and as such its Quality is 80 and it never alters.

Source: http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/

Stretch goals If you want to make things a little more interesting, try ensuring that if the following items are added to the Gilded Rose, they behave properly:

* "Aged Stilton", which should act like aged brie.

* "Aged Elvish Wine", which should act like aged brie.

* "Backstage passes to the Rat Queens", which should act like any other kind of backstage pass.

* "Backstage passes to the Hard Rock Troll Orchestra", which should act like any other kind of backstage pass.

* "Conjured loincloth", which should act like any other conjured item.

* "Conjured fake beard", which should act like any other conjured item.