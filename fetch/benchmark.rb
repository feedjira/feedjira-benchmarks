require 'benchmark'
require 'csv'
require 'net/http'
require 'curb'

urls = ['http://feedjira.com'] * 100

benchmarks = Benchmark.bmbm do |b|
  b.report('Net::HTTP') do
    urls.each { |url| Net::HTTP.get URI.parse url }
  end

  b.report('Curl::Easy') do
    urls.each { |url| Curl::Easy.perform url }
  end

  b.report('Curl::Multi') do
    Curl::Multi.get urls
  end
end

data = benchmarks.map { |b| { b.label => b.real } }

headers = data.map(&:keys).flatten.map { |h| h.gsub(':', '') }

CSV.open('fetch/results.csv', 'w') do |c|
  c << headers
  c << data.map(&:values).flatten
end
