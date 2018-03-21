class PeopleController < NodesController

  private
    def model
      return Person
    end

    def set_node
      @node = model.find(params[:id])
    end

end
