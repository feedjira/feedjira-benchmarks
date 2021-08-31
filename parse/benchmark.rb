require 'benchmark'

module Feedjira; end

tag = ENV['TAG']
klass = Feedjira

require File.expand_path(File.dirname(__FILE__) + "/../feedjira/lib/#{klass.to_s.downcase}")

files = Dir.glob(File.dirname(__FILE__) + '/../feed_xml/*.xml')
xmls = files.map { |f| File.read f }

benchmarks = Benchmark.bmbm do |b|
  b.report('parse') do
    10.times do
      xmls.each { |xml| klass.parse(xml) }
    end
  end
end

time = benchmarks.first.real

File.open('../parse/results.csv', 'a') { |f| f.puts [tag, time].join(',') }
