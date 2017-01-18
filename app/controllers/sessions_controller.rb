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
  #remembers user via UserPreferences structure. Using a JWT to check if mobile user is authenticated.


  def login

    email_downcase = params[:email].downcase
    user = User.find_by email: email_downcase
    if user && user.authenticate(params[:password])
      authenticate_user(user)
      # if user
      #   log_in user
      # else
      #   render json:{ errors: ['Not Authenticated']}
      # end
    else
      # render :nothing => true, :status => 404 #record not found
      render nothing: true, json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end

  # when this method is called from login(), we assume existence of 'user'. (it is NOT null)
  def authenticate_user(user)
    render json: payload(user)
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
        auth_token: JsonWebToken.encode({user_id: user.id}),
        user: {id: user.id, email: user.email}
    }
  end
end

