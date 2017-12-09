require 'mongoid'
require 'sinatra'
require 'sinatra/namespace'

# DB Setup
Mongoid.load! "mongoid.yml"

# Models
class Event
  include Mongoid::Document

  field :name, type: String
  field :slug, type: String

  validates :name, presence: true
  validates :slug, presence: true

  index({ name: 'text' })
  index({ slug:1 }, { unique: true, name: "slug_index" })

  scope :name, lambda {|name| where(name: /#{name}/)}
  scope :slug, lambda {|slug| where(slug: slug)}
end

# Serializers
class EventSerializer
  def initialize(event)
    @event = event
  end

  def as_json(*)
    data = {
      id:@event.id.to_s,
      name:@event.name,
      slug:@event.slug
    }
    data[:errors] = @event.errors if@event.errors.any?
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
    page = params[:page] || 1
    page_size = params[:page_size] || 25
    events = Event.desc(:id).skip(page_size * (page - 1)).limit(page_size)

    [:name, :slug].each do |filter|
      if params[filter]
        events = events.send(filter, params[filter])
      end
    end
    count = events.count
    events = events.map {|event| EventSerializer.new(event) }
    return {
      meta: {
        total: count
      },
      items: events
    }.to_json
  end

  # show
  get '/events/:slug' do |slug|
    event = Event.where(slug: slug).first
    unless event
      halt 404, {message:'Event Not Found'}.to_json
    end
    EventSerializer.new(event).to_json
  end

  # create
  post '/events' do
    event = Event.new(json_params)
    if event.save
      response.headers['Location'] = "#{request.base_url}/api/events/#{event.slug}"
      status 201
    else
      status 422
      body EventSerializer.new(event).to_json
    end
  end

  # update
  patch '/events/:slug' do |slug|
    event = Event.where(slug: slug).first
    unless event
      halt 404, { message:'Event Not Found'}.to_json
    end
    if event.update_attributes(json_params)
      EventSerializer.new(event).to_json
    else
      status 422
      body EventSerializer.new(event).to_json
    end
  end

  # delete
  delete '/events/:slug' do |slug|
    event = Event.where(slug: slug).first
    if event
      event.destroy
      status 204
    else
      halt 404, {message:'Event Not Found'}.to_json
    end
  end
end
