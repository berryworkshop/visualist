class OrganizationsController < NodesController
  @@model = Organization

  private
    def set_node
      @node = Organization.find(params[:id])
    end

end
