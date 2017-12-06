require 'open-uri'
require 'csv'
require 'json'
require_relative '../utils.rb'

local = [
  "visualist1/wp_posts.csv",
]

filename = File.join(__dir__, local[0])


body = File.read(filename)
csv = CSV.new(body, :headers => true, :header_converters => :symbol)
events = csv.to_a.map { |row| row.to_hash }


events_output = []
events.each do |event|
  name = event[:post_title]

  events_output.push({
    label: "event",
    name: name,
    slug: name.to_s.to_slug
  })
end

events_file = File.join(File.dirname(__FILE__), "../data_ingest/events.json")
File.write(events_file, JSON.pretty_generate(events_output))
