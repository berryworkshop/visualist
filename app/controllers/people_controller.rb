class PeopleController < NodesController
  @@model = Person

  private
    def set_node
      @node = Person.find(params[:id])
    end

end
