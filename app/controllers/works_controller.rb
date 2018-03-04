class WorksController < ApplicationController
  before_action :set_work, only: [:show, :update, :destroy]

  # GET /works
  def index
    @works = Work.all

    render json: NodeSerializer.new(@works).serializable_hash
  end

  # GET /works/1
  def show
    render json: NodeSerializer.new(@work).serializable_hash
  end

  # POST /works
  def create
    @work = Work.new(work_params)

    if @work.save
      render json: NodeSerializer.new(@work).serializable_hash, status: :created, location: @work
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /works/1
  def update
    if @work.update(work_params)
      render json: NodeSerializer.new(@work).serializable_hash
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  # DELETE /works/1
  def destroy
    @work.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def work_params
      params.fetch(:work, {})
    end
end
