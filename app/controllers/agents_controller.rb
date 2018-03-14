class AgentsController < NodesController

  def index
    @nodes = Node.where(type: ["Person", "Organization"])

    render json: serialize(@nodes)
  end

  def show
    nil
  end

  def update
    nil
  end

  def destroy
    nil
  end

  def create
    nil
  end

end
