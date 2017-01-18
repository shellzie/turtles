module Authentication

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