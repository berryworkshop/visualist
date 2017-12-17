require 'open-uri'
require 'csv'
require 'json'
require_relative '../utils.rb'
require 'date'

local = [
  "visualist1/wp_posts.csv",
]

filename = File.join(__dir__, local[0])


body = File.read(filename)
csv = CSV.new(body, :headers => true, :header_converters => :symbol)
events = csv.to_a.map { |row| row.to_hash }


events_output = []
events.each do |event|
  begin
    events_output.push({
      label: "event",
      name: event[:post_title],
      slug: event[:post_title].to_s.to_slug,
      body: event[:post_content],
      date_created: DateTime.strptime(event[:post_date_gmt], "%Y-%m-%d %H:%M:%S").to_s,
      date_modified: DateTime.strptime(event[:post_modified_gmt], "%Y-%m-%d %H:%M:%S").to_s,
    })
  rescue Exception => e
    puts e.message, event[:post_title]
  end
end

events_file = File.join(File.dirname(__FILE__), "../data_ingest/events.json")
File.write(events_file, JSON.pretty_generate(events_output))
