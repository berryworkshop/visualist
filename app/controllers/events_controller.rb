require_relative '../serializers/event_serializer.rb'

class EventsController < NodesController
  @@model = Event

  private
    def set_node
      @node = Event.find(params[:id])
    end

    def serialize(node)
      EventSerializer.new(node).serializable_hash
    end

end
