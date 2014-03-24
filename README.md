# Feedjira Benchmarks

In order to keep Feedjira fast, this project runs a benchmark against every
version of the gem.

## Running the Benchmarks

Its important for benchmarks to be repeatable and verifiyable by another party.
To run these benchmarks first clone down this repo, then `cd` into it. From
there you'll need to clone down the main feedjira code to be used in the
benchmark.

Actually running the benchmarks is as easy as:

$ ./runner feedjira


---


To get this to work, you'd first want to bundle - that just gets the project's
Gemfile. Then you'd want to bundle on each version of the gem.

From there, you can run the benchmarks and generate the graphs.

1. clone down the repo

    $ git clone git://github.com/feedjira/feedjira-benchmarks

2. bundle for the Gemfile

    $ bundle

3. clone down the feedjira project

    $ git clone git://github.com/feedjira/feedjira

4. bundle at each version of gem

    $ ./runner prep.rb

5. run the benchmarks

    $ ./runner test.rb

6. generate the graphs

    $ ruby graph.rb
