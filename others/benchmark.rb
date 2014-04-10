require 'benchmark'
require 'csv'

require 'feedjira'
require 'simple-rss'
require 'feed-normalizer'
require 'feed_me'
require 'feed_parser'

# suppress warnings
$VERBOSE = nil

def files
  @files ||= Dir.glob(File.dirname(__FILE__) + '/../feed_xml/*.xml')
end

def xmls
  @xmls ||= files.map { |file| File.read file }
end

def parse_bench(&block)
  10.times { xmls.each &block }
end

benchmarks = Benchmark.bmbm do |b|
  b.report('feedjira') do
    parse_bench { |xml| Feedjira::Feed.parse xml }
  end

  b.report('simple-rss') do
    parse_bench { |xml| SimpleRSS.parse xml }
  end

  b.report('feed-normalizer') do
    parse_bench { |xml| FeedNormalizer::FeedNormalizer.parse xml }
  end

  b.report('feed_me') do
    parse_bench { |xml| FeedMe.parse xml }
  end

  b.report('feed_parser') do
    parse_bench { |xml| FeedParser.new(feed_xml: xml).parse }
  end
end

data = benchmarks.map { |b| { b.label => b.real } }

CSV.open('others/results.csv', 'w') do |c|
  c << data.map(&:keys).flatten
  c << data.map(&:values).flatten
end
