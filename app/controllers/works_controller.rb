class WorksController < NodesController

  private
    def set_node
      @node = Work.find(params[:id])
    end

end
