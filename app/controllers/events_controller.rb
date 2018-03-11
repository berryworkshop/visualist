require_relative '../serializers/event_serializer.rb'

class EventsController < NodesController

  private
    def model
      return Event
    end

    def set_node
      @node = model.find(params[:id])
    end

    def serialize(node)
      EventSerializer.new(node).serializable_hash
    end

end
