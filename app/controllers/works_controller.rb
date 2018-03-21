class WorksController < NodesController

  private
    def model
      return Work
    end

    def set_node
      @node = model.find(params[:id])
    end

end
