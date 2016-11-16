class UsersController < ApplicationController
  include UsersHelper

  before_action :logged_in_user, except: [:new, :create, :register]
  before_action :correct_user,   except: [:new, :create, :register]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the App Store!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  #called from ios app.
  def register
    debugger
    Rails.logger.debug "++++++++++ in register func"
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      log_in @user
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 404
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(login_url) unless current_user?(@user)
    end
end
