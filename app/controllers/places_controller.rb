class PlacesController < NodesController
  @@model = Place

  private
    def set_node
      @node = Place.find(params[:id])
    end

end
