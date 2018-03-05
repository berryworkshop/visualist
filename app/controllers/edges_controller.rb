require_relative '../serializers/edge_serializer.rb'

class EdgesController < ApplicationController
  before_action :set_edge, only: [:show, :update, :destroy]

  # GET /edges
  def index
    @edges = Edge.all

    render json: serialize(@edges)
  end

  # GET /edges/1
  def show
    render json: serialize(@edge)
  end

  # POST /edges
  def create

    @edge = Edge.new(edge_params)

    if @edge.save
      render json: serialize(@edge), status: :created, location: @edge
    else
      render json: @edge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /edges/1
  def update
    if @edge.update(edge_params)
      render json: serialize(@edge)
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

    def serialize(node)
      EdgeSerializer.new(node).serializable_hash
    end

    # Only allow a trusted parameter "white list" through.
    def edge_params
      params.require(:edge).permit(:subject_id, :predicate, :dobject_id, :properties)
    end
end
