# Feedjira Benchmarks

This project contains the benchmarks used to ensure [Feedjira][f] stays fast.

[f]: https://github.com/feedjira/feedjira

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
|-- fetch
+-- parse
```

Next `bundle` to grab the project's requirements.

Lastly, producing the charts does rely on having R installed. If you're on a
Mac, this should work:

```
$ brew tap homebrew/science
$ brew install r
```

## Running the parse benchmark

This benchmark is run against each version of the gem - run it like this:

```
$ parse/run-all
```

This command will output three files:

* parse/results.txt - the raw numbers from the benchmark
* parse/results.csv - the totals from the raw numbers in CSV
* parse/parse-benchmark.png - that CSV converted to chart form

## Running the fetching benchmark

This benchmark compares the speeds of various fetching options - run it like
this:

```
$ fetch/run
```

This command will output three files:

* fetch/results.txt - the raw numbers from the benchmark
* fetch/results.csv - the totals from the raw numbers in CSV
* fetch/fetch-benchmark.png - that CSV converted to chart form
