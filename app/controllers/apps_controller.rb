class AppsController < ApplicationController
  include UsersHelper
  include TurtlesHelper
  before_action :logged_in_user

  def index
    @first_turtle = first_turtle
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
  end

end

