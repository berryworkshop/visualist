class WorksController < NodesController
  @@model = Work

  private
    def set_node
      @node = Work.find(params[:id])
    end

end
