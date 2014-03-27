# Feedjira Benchmarks

In order to keep Feedjira fast, this project runs a benchmark against every
version of the gem.

## Running the Benchmarks

Its important for benchmarks to be repeatable and verifiyable by another party.
Getting setup to run the benchmarks requires that you first clone down this repo
and then also clone down the feedjira one:

```
$ git clone git://github.com/feedjira/feedjira-benchmarks
$ cd feedjira-benchmarks
$ git clone git://github.com/feedjira/feedjira
```

This will give you a directory structure like this:

```
feedjira-benchmarks
|-- feed_xml
|-- feedjira
+-- parse
```

Next bundle to grab the project's requirements and you'll be all set to run the
various benchmarks.

## Running the parse benchmark

This benchmark is run against each version of the gem - run it like this:

```
$ parse/run-all
```

This command will output two files:

* parse/results.txt - the raw numbers from the benchmark
* parse/parse-benchmark.png - those raw numbers in chart form
