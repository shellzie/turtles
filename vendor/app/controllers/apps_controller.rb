class AppsController < ApplicationController
  include UsersHelper
  before_action :logged_in_user

  def index
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
  end

end

