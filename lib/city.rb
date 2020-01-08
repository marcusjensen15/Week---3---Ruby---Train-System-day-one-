class City
  attr_accessor :name, :city_id


  def initialize(attributes)
    @name = name.fetch(:name)
    @city_id = city_id.fetch(:city_id)

  end

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @city_id = attributes.fetch(:city_id)

  end

  def self.all
    returned_cities = DB.exec("SELECT * FROM cities;")
    cities = []
    returned_cities.each() do |city|
      name = city.fetch("name")
      id = city.fetch("city_id").to_i
      cities.push(City.new({:name => name, :city_id => id}))
    end
    cities

  end

  def save
    result = DB.exec("INSERT INTO cities (name) VALUES ('#{name}') RETURNING city_id;")
    @city_id = result.first().fetch("city_id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM cities *;")
  end

  def delete()
    DB.exec("DELETE FROM cities WHERE city_id = #{@city_id};")

  end

  def update(name)
    @name = name
    DB.exec("UPDATE cities SET name= '#{@name}' WHERE city_id = '#{@city_id}';")
  end

  def self.find(city_id)
    city = DB.exec("SELECT * FROM cities WHERE city_id = #{city_id};").first
    if city

    name = city.fetch("name")
    city_id = city.fetch("city_id").to_i
    City.new({:name => name, :city_id => city_id})
  else
    nil
  end

  end

  def ==(city_compare)
    if city_compare != nil
      self.name() == city_compare.name()
    else
      false
    end
  end











end
