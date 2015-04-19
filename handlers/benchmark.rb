require 'benchmark'
require 'csv'

require 'feedjira'

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
  b.report('nokogiri') do
    SAXMachine.handler = :nokogiri

    parse_bench { |xml| Feedjira::Feed.parse xml }
  end

  b.report('ox') do
    SAXMachine.handler = :ox

    parse_bench { |xml| Feedjira::Feed.parse xml }
  end

  b.report('oga') do
    SAXMachine.handler = :oga

    parse_bench { |xml| Feedjira::Feed.parse xml }
  end
end

data = benchmarks.map { |b| { b.label => b.real } }

CSV.open('handlers/results.csv', 'w') do |c|
  c << data.map(&:keys).flatten
  c << data.map(&:values).flatten
end
