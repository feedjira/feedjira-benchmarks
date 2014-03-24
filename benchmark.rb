require 'benchmark'

module Feedjira; end
module Feedzirra; end

klass = ENV['TAG'] >= 'v0.9.0' ? Feedjira : Feedzirra

require File.expand_path(File.dirname(__FILE__) + "/feedjira/lib/#{klass.to_s.downcase}")

files = Dir.glob(File.dirname(__FILE__) + '/feed_xml/*.xml')
xmls = files.map { |f| File.read f }

Benchmark.bmbm do |b|
  b.report('parse') do
    10.times do
      xmls.each { |xml| klass::Feed.parse xml }
    end
  end
end
