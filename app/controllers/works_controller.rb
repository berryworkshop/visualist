require_relative '../serializers/work_serializer.rb'

class WorksController < NodesController

  private
    def model
      return Work
    end

    def set_node
      @node = model.find(params[:id])
    end

    def serialize(node)
      WorkSerializer.new(node).serializable_hash
    end

end
