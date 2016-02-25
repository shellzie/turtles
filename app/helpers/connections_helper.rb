module ConnectionsHelper

  def connection_exists(turtle_id)
    record = Connection.find_by(turtle_id: turtle_id)
    return record
  end
end
