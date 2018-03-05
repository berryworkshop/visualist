class PagesController < NodesController
  @@model = Page

  private
    def set_node
      @node = Page.find(params[:id])
    end

end
