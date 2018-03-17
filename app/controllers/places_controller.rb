require_relative '../serializers/place_serializer.rb'

class PlacesController < NodesController

  private
    def model
      return Place
    end

    def set_node
      @node = model.find(params[:id])
    end

    def serialize(node)
      PlaceSerializer.new(node).serializable_hash
    end

end
