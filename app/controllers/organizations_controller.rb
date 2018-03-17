require_relative '../serializers/organization_serializer.rb'

class OrganizationsController < NodesController

  private
    def model
      return Organization
    end

    def set_node
      @node = model.find(params[:id])
    end

    def serialize(node)
      OrganizationSerializer.new(node).serializable_hash
    end

end
