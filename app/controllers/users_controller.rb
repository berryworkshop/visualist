require_relative '../serializers/user_serializer.rb'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: serialize(@users)
  end

  # GET /users/1
  def show
    render json: serialize(@user)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: serialize(@user), status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: serialize(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def serialize(user)
      UserSerializer.new(user).serializable_hash
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:attributes).permit(
        :name, :email
      )
    end
end
