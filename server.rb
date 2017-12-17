# require 'mongoid'
require 'sinatra'
require 'sinatra/namespace'

# DB Setup
# Mongoid.load! "mongoid.yml"

# Models
# class Event
#   include Mongoid::Document

#   field :name, type: String
#   field :slug, type: String
#   field :body, type: String
#   field :date_created, type: DateTime
#   field :date_modified, type: DateTime

#   validates :name, presence: true
#   validates :slug, presence: true
#   validates :body, presence: true
#   validates :date_created, presence: true
#   validates :date_modified, presence: true

#   index({ name: 'text' })
#   index({ slug:1 }, { unique: true, name: "slug_index" })
# end

# Serializers
class EventSerializer
  def initialize(event)
    @event = event
  end

  def as_json(*)
    data = {
      id:   @event.id.to_s,
      name: @event.name,
      slug: @event.slug,
      body: @event.body,
      # date_created: @event.date_created,
      # date_modified: @event.date_modified,
    }
    if @event.errors.any?
      data[:errors] = @event.errors
    end
    data
  end
end

get '/' do
  erb :index
end

namespace '/api' do
  before do
    content_type 'application/json'
  end

  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://{request.env['HTTP_HOST']}"
    end

    def json_params
      begin
        JSON.parse(request.body.read)
      rescue
        halt 400, {message:'Invalid JSON'}.to_json
      end
    end
  end

  # base
  get '/' do
    {
      events: "#{request.base_url}/api/events"
    }.to_json
  end

  # index
  get '/events' do
    page = params.fetch(:page, 1).to_i
    page_size = params.fetch(:page_size, 25).to_i
    events = []
    return {
      meta: {
        total: 0,
        page: page,
        pageSize: page_size,
        pageQty: 1
      },
      items: events
    }.to_json
  end

  # show
  # get '/events/:slug' do |slug|
  #   event = {}
  #   unless event
  #     halt 404, {message:'Event Not Found'}.to_json
  #   end
  #   EventSerializer.new(event).to_json
  # end

  # create
  # post '/events' do
  #   event = Event.new(json_params)
  #   if event.save
  #     response.headers['Location'] = "#{request.base_url}/api/events/#{event.slug}"
  #     status 201
  #   else
  #     status 422
  #     body EventSerializer.new(event).to_json
  #   end
  # end

  # update
  # patch '/events/:slug' do |slug|
  #   event = Event.where(slug: slug).first
  #   unless event
  #     halt 404, { message:'Event Not Found'}.to_json
  #   end
  #   if event.update_attributes(json_params)
  #     EventSerializer.new(event).to_json
  #   else
  #     status 422
  #     body EventSerializer.new(event).to_json
  #   end
  # end

  # delete
  # delete '/events/:slug' do |slug|
  #   event = Event.where(slug: slug).first
  #   if event
  #     event.destroy
  #     status 204
  #   else
  #     halt 404, {message:'Event Not Found'}.to_json
  #   end
  # end
end
