class TurtlesController < ApplicationController
  include UsersHelper
  before_action :logged_in_user

  def new
    @turtle = Turtle.new
  end

  def create
    @turtle = Turtle.new
    if params[:turtle][:image_path].present?
      handle_image
      @turtle.image_path = params[:turtle][:image_path].original_filename
    end
    @turtle.name = params[:turtle][:name] #required to be present
    if params[:turtle][:bio].present?
      @turtle.bio = params[:turtle][:bio]
    end
    @turtle.user_id = params[:turtle][:user_id] #required to be present
    if @turtle.save
      flash[:success] = "Turtle Saved!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  #api for ios app
  def populate_profile
    byebug
    debug
    logger.debug "+++++++++++ in populate profile++++++++++++++"
    @turtle = Turtle.new
    # if params[:turtle][:image_path].present?
    #   handle_image
    #   @turtle.image_path = params[:turtle][:image_path].original_filename
    # end

    @turtle.name = params[:turtle][:name] #required to be present
    if params[:turtle][:bio].present?
      @turtle.bio = params[:turtle][:bio]
    end
    @turtle.user_id = params[:turtle][:user_id] #required to be present

    if @turtle.save
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 404
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
