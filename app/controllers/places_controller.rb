class PlacesController < NodesController

  private
    def set_node
      @node = Place.find(params[:id])
    end

end
