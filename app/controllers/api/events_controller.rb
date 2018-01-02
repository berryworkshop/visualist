include Rails.application.routes.url_helpers

class Api::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /
  def root
    render json: {
      events: 'http://example.com'
    }
  end

  # GET /events
  def index
    @events = Event.all.order(created_at: :desc)

    page = params.fetch(:page, 0).to_i
    page < 1 ? page = 1 : page
    page_size = params.fetch(:page_size, 25).to_i

    paged = @events.offset(page_size * (page-1)).limit(page_size)

    render json: {
      meta: {
        total: @events.size,
        page: page,
        pageSize: page_size,
        pageQty: 1,
      },
      items: paged
    }
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: [:api, @event]
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
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
      params.require(:event).permit(:name, :description, :start_date)
    end

end
