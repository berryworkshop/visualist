class PagesController < NodesController
  # before_action :authenticate_user

  private
    def model
      return Page
    end

    def set_node
      @node = model.find(params[:id])
    end

end
