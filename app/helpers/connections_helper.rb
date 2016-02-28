module ConnectionsHelper

  def connection_exists(turtle_id)
    record = Connection.find_by(turtle_id: turtle_id)
    return record
  end

  def last_connection(turtle_id)
    Connection.where("turtle_id = #{turtle_id}").order('created_at desc').take
  end
end
