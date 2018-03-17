require_relative '../serializers/person_serializer.rb'

class PeopleController < NodesController

  private
    def model
      return Person
    end

    def set_node
      @node = model.find(params[:id])
    end

    def serialize(node)
      PersonSerializer.new(node).serializable_hash
    end

end
