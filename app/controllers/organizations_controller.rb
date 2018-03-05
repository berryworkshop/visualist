class OrganizationsController < NodesController

  private
    def set_node
      @node = Organization.find(params[:id])
    end

end
