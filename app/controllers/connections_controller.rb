class ConnectionsController < ApplicationController

  def turtleinfo
    @connection = Connection.new
    if (params[:turtle_name].present? && params[:ip_address].present?)
      @connection.turtle_name = params[:turtle_name]
      @connection.ip_address = params[:ip_address]
      @connection.connect_time = params[:updated_at]
    end

    if @connection.save
      flash[:success] = "Connection Successful!"
      redirect_to connections_url
    else
      console.log "Error parsing get arguments"
    end
  end

  def index
    @connections = Connection.all
  end

end