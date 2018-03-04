class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :update, :destroy]

  # GET /places
  def index
    @places = Place.all

    render json: NodeSerializer.new(@places).serializable_hash
  end

  # GET /places/1
  def show
    render json: NodeSerializer.new(@place).serializable_hash
  end

  # POST /places
  def create
    @place = Place.new(place_params)

    if @place.save
      render json: NodeSerializer.new(@place).serializable_hash, status: :created, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      render json: NodeSerializer.new(@place).serializable_hash
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def place_params
      params.fetch(:place, {})
    end
end
