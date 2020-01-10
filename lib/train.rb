class Train
  attr_accessor :name, :train_id
  # attr_reader :train_id

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @train_id = attributes.fetch(:train_id)

  end

  def self.all
    returned_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    returned_trains.each() do |train|
      name = train.fetch("name")
      id = train.fetch("train_id").to_i
      trains.push(Train.new({:name => name, :train_id => id}))
    end
    trains

  end

  def save
    result = DB.exec("INSERT INTO trains (name) VALUES ('#{name}') RETURNING train_id;")
    @train_id = result.first().fetch("train_id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM trains *;")
  end

  def delete()
    DB.exec("DELETE FROM trains WHERE train_id = #{@train_id};")

  end

  def update(name)
    @name = name
    DB.exec("UPDATE trains SET name= '#{@name}' WHERE train_id = '#{@train_id}';")
  end

  def self.find(train_id)
    train = DB.exec("SELECT * FROM trains WHERE train_id = #{train_id};").first
    if train

    name = train.fetch("name")
    train_id = train.fetch("train_id").to_i
    Train.new({:name => name, :train_id => train_id})
  else
    nil
  end

  end

  def ==(train_compare)
    if train_compare != nil
      self.name() == train_compare.name()
    else
      false
    end
  end


    def delete_train_stops()
      DB.exec("DELETE FROM stops WHERE train_name = '#{@name}';")

    end


    #gets all of the cities for a given train (no test for this method)

    def cities_for_train()

      returned_cities = DB.exec("SELECT city_name FROM stops WHERE train_name = '#{@name}';")
      cities = []
      returned_cities.each do |city|
        cities.push(city.fetch("city_name"))
      end
      cities

    end


end
