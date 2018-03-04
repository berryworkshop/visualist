require_relative '../serializers/edge_serializer.rb'

class EdgesController < ApplicationController
  before_action :set_edge, only: [:show, :update, :destroy]

  # GET /edges
  def index
    @edges = Edge.all

    render json: EdgeSerializer.new(@edges).serializable_hash
  end

  # GET /edges/1
  def show
    render json: EdgeSerializer.new(@edge).serializable_hash
  end

  # POST /edges
  def create

    @edge = Edge.new(edge_params)

    if @edge.save
      render json: EdgeSerializer.new(@edge).serializable_hash, status: :created, location: @edge
    else
      render json: @edge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /edges/1
  def update
    if @edge.update(edge_params)
      render json: EdgeSerializer.new(@edge).serializable_hash
    else
      render json: @edge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /edges/1
  def destroy
    @edge.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edge
      @edge = Edge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def edge_params
      params.require(:edge).permit(:subject_id, :predicate, :dobject_id, :properties)
    end
end
