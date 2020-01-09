
require('sinatra')
require('sinatra/reloader')
require('./lib/city')
require('./lib/train')
require('pry')
require("pg")

also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "train_system"})

get ('/') do
  @train = Train.all
  erb(:home)
end

get ('/home') do
  @train = Train.all
  erb(:home)
end

#This shows the operator page
get ('/home/operator') do
  @trains = Train.all
  @cities = City.all
  erb(:operator)
end

#this adds all the trains and cities for the operator view

post ('/home/operator') do
  if params[:train_name]
      name = params[:train_name]
      train = Train.new({:name => name, :train_id => nil})
      train.save()
      @trains = Train.all()
      @cities = City.all()
    erb(:operator)
  elsif params[:city_name]
    name = params[:city_name]
    city = City.new({:name => name, :city_id => nil})
    city.save()
    @cities = City.all()
    @trains = Train.all()

  erb(:operator)
  end
end

#this shows the page allowing the operator to add a new train


get('/train/new') do
  erb(:new_train)
end

#this shows the page allowing the operator to add a new city
get('/city/new') do
  erb(:new_city)
end

#this shows the rider view
get ('/home/rider') do
  erb(:rider)
end

#this shows the page on the operator view for a specific train id

get ('/home/operator/trains/:train_id')do
  @train = Train.find(params[:train_id].to_i())

  erb(:train)

end



#this shows the page on the operator view for a specific city id

get ('/home/operator/cities/:city_id')do

  @city = City.find(params[:city_id].to_i())

  erb(:city)

end

#this shows the edit page for a specific train

get('/home/operator/trains/:train_id/edit') do
  @train = Train.find(params[:train_id].to_i())
  erb(:edit_train)
end

#this shows the edit page for a specific city

get('/home/operator/cities/:city_id/edit') do
  @city = City.find(params[:city_id].to_i())
  erb(:edit_city)
end

#This will allow the operator to edit a train

patch('/home/operators/trains/:train_id')do
  @train = Train.find(params[:train_id].to_i())
  @train.update(params[:name])
  @trains = Train.all
  @cities = City.all
  erb(:operator)

end

#This will allow the operator to delete a train

delete('/home/operators/trains/:train_id')do
  @train = Train.find(params[:train_id].to_i())
  @train.delete()
  @trains = Train.all
  @cities = City.all

  erb(:operator)
end

#This will allow the operator to edit a city

patch ('/home/operators/cities/:city_id') do
  @city = City.find(params[:city_id].to_i())
  @city.update(params[:name])
  @trains = Train.all
  @cities = City.all
  erb(:operator)
end

#This will allow the operator to delete a city

delete('/home/operators/cities/:city_id')do
  @city = City.find(params[:city_id].to_i())
  @city.delete()
  @trains = Train.all
  @cities = City.all

  erb(:operator)
end


#### Create a view similar to the operator view. List of trains and list of cities. click on a city and see trains that go to it. click on a train and see which cities it goes to.
