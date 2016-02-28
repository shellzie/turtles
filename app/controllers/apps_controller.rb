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
    @last_connect_time = @connection.updated_at.in_time_zone("America/Los_Angeles")
  end

  def show
    @app = App.find(params[:id])
  end

end

