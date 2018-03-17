require_relative '../serializers/page_serializer.rb'

class PagesController < NodesController

  private
    def model
      return Page
    end

    def set_node
      @node = model.find(params[:id])
    end

    def serialize(node)
      PageSerializer.new(node).serializable_hash
    end

end
