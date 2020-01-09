
require 'rspec'
require 'pg'
require 'train'
require 'city'
require 'pry'
require 'stop'


# Shared code for clearing tests between runs and connecting to the DB will also go here.
DB = PG.connect({:dbname => 'train_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM trains *;")
    DB.exec("DELETE FROM cities *;")
    DB.exec("DELETE FROM stops *;")
  end
end
