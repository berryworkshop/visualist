require_relative '../serializers/node_serializer.rb'

class NodesController < ApplicationController
  before_action :set_node, only: [:show, :update, :destroy]

  # GET /nodes
  def index
    @nodes = model.all

    render json: serialize(@nodes)
  end

  # GET /nodes/1
  def show
    render json: serialize(@node)
  end

  # POST /nodes
  def create
    @node = model.new(node_params)

    if @node.save
      render json: serialize(@node), status: :created, location: @node
    else
      render json: @node.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nodes/1
  def update
    if @node.update(node_params)
      render json: serialize(@node)
    else
      render json: @node.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nodes/1
  def destroy
    @node.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def model
      return Node
    end

    def set_node
      @node = model.find(params[:id])
    end

    def serialize(node)
      NodeSerializer.new(node).serializable_hash
    end

    # Only allow a trusted parameter "white list" through.
    def node_params
      params.require(:attributes).permit(
        :type, :slug, :title, :body, :properties)
    end
end
