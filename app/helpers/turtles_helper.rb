module TurtlesHelper
  include SessionsHelper

  def first_turtle
    Turtle.find_by(user_id: @current_user.id) # returns first turtle of current user
  end
end
