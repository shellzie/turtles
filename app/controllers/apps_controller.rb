class AppsController < ApplicationController
  include UsersHelper
  include TurtlesHelper
  before_action :logged_in_user
  include NetworksHelper
  include ConnectionsHelper

  def index
    @apps = App.all
    @first_turtle = first_turtle
    @first_network = first_network
    if @first_turtle.present? && first_network.present?
      @connection = last_connection(@first_turtle.id)
      @last_connect_time = @connection.updated_at.in_time_zone("America/Los_Angeles")
    end
  end

  def show
    @app = App.find(params[:id])
  end

end

