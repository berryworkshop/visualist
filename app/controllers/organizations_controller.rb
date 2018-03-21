class OrganizationsController < NodesController

  private
    def model
      return Organization
    end

    def set_node
      @node = model.find(params[:id])
    end

end
