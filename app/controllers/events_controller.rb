require_relative '../serializers/node_serializer.rb'

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: NodeSerializer.new(@events).serializable_hash
  end

  # GET /events/1
  def show
    render json: NodeSerializer.new(@event).serializable_hash
  end

  # POST /events
  def create
    @event = Event.new(attributes: event_params)

    if @event.save
      render json: NodeSerializer.new(@event).serializable_hash, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(attributes: event_params)
      render json: NodeSerializer.new(@event).serializable_hash
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:attributes).permit(
        :type, :slug, :title, :body, :properties)
    end
end
