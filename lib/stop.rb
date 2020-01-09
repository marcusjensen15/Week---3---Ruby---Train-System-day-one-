class Stop

  attr_accessor :city_name, :stop_id, :train_name, :time

  def initialize(attributes)
    @train_name = attributes.fetch(:train_name)
    @city_name = attributes.fetch(:city_name)
    @stop_id = attributes.fetch(:stop_id).to_i
    @time = attributes.fetch(:time)

  end

  def save
    result = DB.exec("INSERT INTO stops (city_name, train_name, time) VALUES ('#{@city_name}','#{@train_name}', '#{@time}') RETURNING stop_id;")
    @stop_id = result.first().fetch("stop_id").to_i
  end


  def delete()
  DB.exec("DELETE FROM stops WHERE stop_id = #{@stop_id};")
  end

#allows the user to delete all of the stops for a given city (not tested)
  def delete_city_stops()
    DB.exec("DELETE FROM stops WHERE city_name = '#{@city_name}';")

  end

  def update(city_name, train_name, time)
  @city_name = city_name
  @train_name = train_name
  @time = time

  DB.exec("UPDATE stops SET city_name = '#{@city_name}', train_name = '#{@train_name}', time = '#{@time}' WHERE stop_id = #{stop_id};")
end

def self.all()
  returned_stops = DB.exec("SELECT * FROM stops;")
  stops = []
  returned_stops.each() do |stop|
    city_name = stop.fetch("city_name")
    stop_id = stop.fetch("stop_id").to_i
    train_name = stop.fetch("train_name")
    time = stop.fetch("time")
    stops.push(Stop.new({:city_name => city_name, :stop_id => stop_id, :train_name => train_name, :time => time}))
  end
  stops
end

def ==(stop_compare)
  if stop_compare != nil
    self.city_name() == stop_compare.city_name() && self.train_name() == stop_compare.train_name() && self.time() == stop_compare.time()
  else
    false
  end
end



def self.find(stop_id)
  stop = DB.exec("SELECT * FROM stops WHERE stop_id = #{stop_id};").first
  if stop

  city_name = stop.fetch("city_name")
  train_name = stop.fetch("train_name")
  time = stop.fetch("time")
  Stop.new({:city_name => city_name, :train_name => train_name, :time => time, :stop_id => stop_id})
else
  nil
end

end


end
