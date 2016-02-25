class NetworksController < ApplicationController
  include UsersHelper
  include TurtlesHelper
  include ConnectionsHelper

  before_action :logged_in_user

  def connect_result
    # debugger
    if connection_exists(params[:turtle_id]).present?
      flash[:success] = "Turtle Connected Successfully!"
      # render status: 200
      render :text => "OK"
    else
      render :nothing => true, :status => 500
    end
  end

  def show
    @network = Network.find(params[:id])
  end

  def new
    @network = Network.new
  end

  def create
    @network = Network.new(network_params)
    if @network.save
      redirect_to action: "show", id: @network.id
    else
      render 'new'
    end
  end

  def edit
    @network = Network.find(params[:id])
  end

  def update
    @network = Network.find(params[:id])
    if @network.update_attributes(network_params)
      redirect_to action: "show", id: @network
    else
      render 'edit'
    end
  end

  private

  def network_params
    params.require(:network).permit(:name, :password, :turtle_id)
  end

end