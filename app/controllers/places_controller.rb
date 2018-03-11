class PlacesController < NodesController

  private
    def model
      return Place
    end

    def set_node
      @node = model.find(params[:id])
    end

end
