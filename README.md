Gilded Rose Kata Refactoring Workshop
=====================================

This repo contains an exercise for our refactoring workshop. A big debt of gratitude is due to Alistair McKinnell for presenting the Gilded Rose Kata and his characterization tests at the last Toronto Ruby Brigade session. We knew immediately that his work would provide an excellent basis for refactoring, and this drove us to (finally!) actually organize it.

Alistair's repo (which we've forked here) was built to demonstrate "three advanced developer testing techniques as they apply to the [Gilded Rose Kata](http://craftsmanship.sv.cmu.edu/exercises/gilded-rose-kata)."  You can learn more about those techniques in the parent repo.

We've restructured the repo to provide a quick-start introduction to refactoring techniques by replacing the refactored Gilded Rose Kata code with the original kruft (translated into Ruby by professor - check it out here: https://github.com/professor/GildedRose), but retaining the awesome characterization tests Alistair built.

Your mission is the same as in the original Gilded Rose Kata, but if you find it a bit to easy, we've added some stretch goals too.  Have fun!  The rules are in the wiki.


Setup
___________


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