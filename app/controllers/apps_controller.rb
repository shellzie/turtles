class AppsController < ApplicationController
  include UsersHelper
  include TurtlesHelper
  before_action :logged_in_user
  include NetworksHelper
  include ConnectionsHelper

  def index
    @first_turtle = first_turtle
    @apps = App.all
    @first_network = first_network
    @connection = last_connection(@first_turtle.id)
  end

  def show
    @app = App.find(params[:id])
  end

end

