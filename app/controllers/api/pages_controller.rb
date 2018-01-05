class Api::PagesController < ApplicationController
  before_action :set_page, only: [:show, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]
end
