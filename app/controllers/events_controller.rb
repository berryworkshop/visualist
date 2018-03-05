require_relative '../serializers/node_serializer.rb'

class EventsController < NodesController

  private
    def set_node
      @node = Event.find(params[:id])
    end

    def node_params
      params.require(:attributes).permit(
        :type, :slug, :title, :body, :properties)
    end
end
