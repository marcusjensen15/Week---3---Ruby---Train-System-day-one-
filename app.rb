
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

get ('/home/operator') do
  erb(:operator)
end

get('/train/new') do
  erb(:new_train)
end

get('/trains/new') do
  erb(:new_train)
end


get ('/home/rider') do
  erb(:rider)
end
