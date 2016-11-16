class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  #separate login method for mobile since params are not stored in params[:sessions] they are stored
  # in params[:email] and also we don't have to use 'remember me' cookie since xcode
  #remembers user via UserPreferences structure
  def login
    debugger
    Rails.logger.debug "++++++++++ in login func"
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 404 #record not found
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end