# Gilded Rose Refactoring Kata

## Getting started

- Clone or Download this Repository
- Run `bundle install` to install all the dependencies

## Usage

- Open `IRB` in your terminal
- Type `load ./lib/gilded_rose.rb`
- Generate an array of items
	```
	item_1 = Item.new('Aged Brie', 5, 10)
	item_2 = Item.new('Item', 5, 0)
	items = [item_1, item_2]
	```
- Create a new GildedRose with that array of items
	```
	gilded_rose = GildedRose.new(items)
	gilded_rose.update_quality
	```

## Running tests

- Run `rspec` from your terminal


## Specifications

- Item SellIn value: number of days we have to sell the item.
- Item Quality value: how valuable the item is (always between 0 and 50)
- At the end of each day our system lowers both values for every item.
- Once the sell by date has passed, Quality degrades twice as fast.


#### Exceptions

- "Sulfuras": never has to be sold or decreases in Quality
- "Aged Brie": increases in Quality the older it gets
	- Quality increases by 1  before sell_in date
	- Quality increases by 2  after sell_in date
- "Backstage passes": increases in Quality the older it gets:
	- Quality increases by 2 when there are 10 days or less
	- Quality increases by 3 when there are 5 days or less
	- Quality drops to 0 after the concert


## Implementation

- "Conjured Items": degrade in Quality twice as fast as normal items.


## My approach

- Set up the project, rspec, simplecov and rubocop
- Do test coverage for all the code
- Separate the classes into two different files
- Refactor the code
	- Update_quality method checks the item name and updates the sell_in date.
	- It delegates the update quality functionality into private methods according to the item name
- Implement the new feature 'conjured items'


## Original Readme Content

This Kata was originally created by Terry Hughes (http://twitter.com/TerryHughes). It is already on GitHub [here](https://github.com/NotMyself/GildedRose). See also [Bobby Johnson's description of the kata](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/).

I translated the original C# into a few other languages, (with a little help from my friends!), and slightly changed the starting position. This means I've actually done a small amount of refactoring already compared with the original form of the kata, and made it easier to get going with writing tests by giving you one failing unit test to start with. I also added test fixtures for Text-Based approval testing with TextTest (see [the TextTests](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/master/texttests))

As Bobby Johnson points out in his article ["Why Most Solutions to Gilded Rose Miss The Bigger Picture"](http://iamnotmyself.com/2012/12/07/why-most-solutions-to-gilded-rose-miss-the-bigger-picture), it'll actually give you
better practice at handling a legacy code situation if you do this Kata in the original C#. However, I think this kata
is also really useful for practicing writing good tests using different frameworks and approaches, and the small changes I've made help with that. I think it's also interesting to compare what the refactored code and tests look like in different programming languages.

I wrote this article ["Writing Good Tests for the Gilded Rose Kata"](http://coding-is-like-cooking.info/2013/03/writing-good-tests-for-the-gilded-rose-kata/) about how you could use this kata in a [coding dojo](https://leanpub.com/codingdojohandbook).

## How to use this Kata

The simplest way is to just clone the code and start hacking away improving the design. You'll want to look at the ["Gilded Rose Requirements"](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/master/GildedRoseRequirements.txt) which explains what the code is for. I strongly advise you that you'll also need some tests if you want to make sure you don't break the code while you refactor.

You could write some unit tests yourself, using the requirements to identify suitable test cases. I've provided a failing unit test in a popular test framework as a starting point for most languages.

Alternatively, use the "Text-Based" tests provided in this repository. (Read more about that in the next section)

Whichever testing approach you choose, the idea of the exercise is to do some deliberate practice, and improve your skills at designing test cases and refactoring. The idea is not to re-write the code from scratch, but rather to practice designing tests, taking small steps, running the tests often, and incrementally improving the design.

## Text-Based Approval Testing

This is a testing approach which is very useful when refactoring legacy code. Before you change the code, you run it, and gather the output of the code as a plain text file. You review the text, and if it correctly describes the behaviour as you understand it, you can "approve" it, and save it as a "Golden Master". Then after you change the code, you run it again, and compare the new output against the Golden Master. Any differences, and the test fails.

It's basically the same idea as "assertEquals(expected, actual)" in a unit test, except the text you are comparing is typically much longer, and the "expected" value is saved from actual output, rather than being defined in advance.

Typically a piece of legacy code may not produce suitable textual output from the start, so you may need to modify it before you can write your first text-based approval test. That could involve inserting log statements into the code, or just writing a "main" method that executes the code and prints out what the result is afterwards. It's this latter approach we are using here to test GildedRose.

The Text-Based tests in this repository are designed to be used with the tool "TextTest" (http://texttest.org). This tool helps you to organize and run text-based tests. There is more information in the README file in the "texttests" subdirectory.

## Get going quickly using Cyber-Dojo

I've also set this kata up on [cyber-dojo](http://cyber-dojo.org) for several languages, so you can get going really quickly:

- [JUnit, Java](http://cyber-dojo.org/forker/fork/751DD02C4C?avatar=snake&tag=8)
- [C#](http://cyber-dojo.org/forker/fork/5C5AC766B0?avatar=koala&tag=3)
- [C++](http://cyber-dojo.org/forker/fork/AA86ECBCC9?avatar=rhino&tag=7)
- [Ruby](http://cyber-dojo.org/forker/fork/A8943EAF92?avatar=hippo&tag=9)
- [RSpec, Ruby](http://cyber-dojo.org/forker/fork/8E58B0AD16?avatar=raccoon&tag=3)
- [Python](http://cyber-dojo.org/forker/fork/297041AA7A?avatar=lion&tag=4)
- [Cucumber, Java](http://cyber-dojo.org/forker/fork/0F82D4BA89?avatar=gorilla&tag=48) - for this one I've also written some step definitions for you

## Better Code Hub

I analysed this repo according to the clean code standards on [Better Code Hub](https://bettercodehub.com) just to get an independent opinion of how bad the code is. Perhaps unsurprisingly, the compliance score is low!

[![BCH compliance](https://bettercodehub.com/edge/badge/emilybache/GildedRose-Refactoring-Kata?branch=master)](https://bettercodehub.com/)
