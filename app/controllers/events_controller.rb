class EventsController < NodesController

  private
    def set_node
      @node = Event.find(params[:id])
    end
end
