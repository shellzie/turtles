class TurtlesController < ApplicationController
  include UsersHelper
  before_action :logged_in_user

  def new
    @turtle = Turtle.new
  end

  def create
    handle_image
    @turtle = Turtle.new

    @turtle.name = params[:turtle][:name]
    @turtle.bio = params[:turtle][:bio]
    @turtle.image_path = params[:turtle][:image_path].original_filename
    @turtle.user_id = params[:turtle][:user_id]

    if @turtle.save
      flash[:success] = "Turtle Saved!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

    def handle_image

      name = params[:turtle][:image_path].original_filename
      directory = "public/images/upload"
      path = File.join(directory, name)
      File.open(path, "wb") { |f| f.write(params[:turtle][:image_path].read) }
      flash[:notice] = "File uploaded"
    end

    # def turtle_params
    #   params.require(:turtle).permit(:name, :bio, :image_path, :user_id)
    # end
end
