class PeopleController < NodesController

  private
    def set_node
      @node = Person.find(params[:id])
    end

end
