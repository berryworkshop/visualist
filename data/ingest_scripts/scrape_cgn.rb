require 'open-uri'
require 'nokogiri'
require 'json'
require_relative '../utils.rb'

root_url = "https://www.chicagogallerynews.com/"

organization_list_pages = {
  galleries: [
    "galleries/district/river-north",
    "galleries/district/west-side",
    "galleries/district/south-side",
    "galleries/district/michigan-avenue",
    "galleries/district/north-side",
    "galleries/district/suburbs-midwest",
  ],
  institutions: [
    "institutions/type/museums-universities",
    "institutions/type/alternative-spaces-apartment-galleries",
    "institutions/type/associations-advocacy",
    "institutions/type/art-centers-studios",
  ],
  services: [
    "art-services/specialties/appraisers",
    "art-services/specialties/art-fairs",
    "art-services/specialties/art-handling",
    "art-services/specialties/art-supplies-products",
    "art-services/specialties/art-tours",
    "art-services/specialties/auction-houses",
    "art-services/specialties/careers-mentoring-residencies",
    "art-services/specialties/collections-management",
    "art-services/specialties/conservation-restoration",
    "art-services/specialties/framing",
    "art-services/specialties/imaging-photography",
    "art-services/specialties/insurance",
    "art-services/specialties/private-dealers-art-consultants",
    "art-services/specialties/rental-spaces-special-events",
  ]
}

local = [
  "./scrape_cgn/raw_galleries_river-north.html",
  "./scrape_cgn/raw_institutions_museums-universities.html",
  "./scrape_cgn/raw_services_appraisers.html",
]

# from web
# doc = Nokogiri::HTML(open(root_url << organization_list_pages[:galleries][0] ))

# in development
filename = File.join(File.dirname(__FILE__), local[0])
doc = File.open(filename) { |f| Nokogiri::XML(f) }

orgs = doc.css(".organization")

orgs_output = []
orgs.each do |org|
  name = org.at_css('.text').content

  orgs_output.push({
    label: "org",
    name: name,
    slug: name.to_slug
  })
end

orgs_file = File.join(File.dirname(__FILE__), "../data_ingest/orgs.json")
orgs_existing = []#JSON.parse(File.read(orgs_file))

orgs_existing.concat(orgs_output)
File.write(orgs_file, JSON.pretty_generate(orgs_existing))
