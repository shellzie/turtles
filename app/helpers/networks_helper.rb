module NetworksHelper
  include SessionsHelper
  include TurtlesHelper

  def first_network
    turtle_id = Turtle.find_by(user_id: @current_user.id)
    Network.find_by(turtle_id: turtle_id) # returns first network of current user
  end
end
