class EventsController < NodesController

  private
    def model
      return Event
    end

    def set_node
      @node = model.find(params[:id])
    end

end
