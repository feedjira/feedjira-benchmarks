require 'googlecharts'

class Point
  def initialize(rows)
    @first_row = rows.first
    @last_row = rows.last
  end

  def value
    @last_row.match(/\(\s+([\d.]+)/).captures.first
  end

  def version
    @first_row.split.first
  end
end

points = []
File.read('output.txt').split("\n").each_slice(7) { |r| points << Point.new(r) }

data = points.map(&:value).map &:to_f
versions = points.map &:version

Gchart.line(
  axis_labels: [versions],
  axis_range: [nil, [0, data.max, 0.5]],
  axis_with_labels: ['x', 'y'],
  data: data,
  filename: 'chart.png',
  format: 'file',
  size: '600x400',
  title: 'parse'
)
