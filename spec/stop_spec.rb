require 'spec_helper'

describe ('#Stop') do

  describe('#save')do
    it('Will allow a user to save a stop')do
    stop = Stop.new(:city_name => "Chicago", :train_name => "Hi", :time => "12", :stop_id => nil)
    stop.save
    expect(Stop.all).to(eq([stop]))

    end
  end

  describe('#==') do
  it("is the same stop if it has the same time, train and city as another stop") do
    stop = Stop.new(:city_name => "Chicago", :train_name => "Hi", :time => "12", :stop_id => nil)
    stop2 = Stop.new(:city_name => "Chicago", :train_name => "Hi", :time => "12", :stop_id => nil)
    expect(stop).to(eq(stop2))
  end
end


describe('update') do
  it("allows the user to update the details of a stop") do
    stop = Stop.new(:city_name => "Chicago", :train_name => "Hi", :time => "12", :stop_id => nil)
    stop.save()
    stop.update("Portland", "Howdy", "11")
    expect(stop.city_name).to(eq("Portland"))
  end
end

describe('delete') do
  it("allows the user to delete a stop") do
    stop = Stop.new(:city_name => "Chicago", :train_name => "Hi", :time => "12", :stop_id => nil)
    stop.save()
    stop2 = Stop.new(:city_name => "Chicagox", :train_name => "Hid", :time => "124", :stop_id => nil)
    stop2.save()
    stop.delete()
    expect(Stop.all).to(eq([stop2]))
  end
end

describe('delete_city_stops') do
  it("allows the user to delete all of the stops for a given city") do
    stop = Stop.new(:city_name => "Chicago", :train_name => "Hi", :time => "12", :stop_id => nil)
    stop.save()
    stop3 = Stop.new(:city_name => "Chicago", :train_name => "H", :time => "12", :stop_id => nil)
    stop3.save()
    stop2 = Stop.new(:city_name => "Chicagox", :train_name => "Hid", :time => "124", :stop_id => nil)
    stop2.save()
    stop.delete_city_stops()
    expect(Stop.all).to(eq([stop2]))
  end
end

describe('all') do
  it("show all saved trains") do
    stop = Stop.new(:city_name => "Chicago", :train_name => "Hi", :time => "12", :stop_id => nil)
    stop.save()
    stop2 = Stop.new(:city_name => "Chicagoc", :train_name => "Hi", :time => "12", :stop_id => nil)
    stop2.save()
    expect(Stop.all).to(eq([stop, stop2]))
  end
end

describe('find') do
  it("allows a user to find a stop by its stop_id") do
    hi = Stop.new({:city_name => "Oink", :stop_id =>nil, :train_name => "beef", :time => "12"})
    hi.save()
    bye = Stop.new({:city_name => "ink", :stop_id =>nil, :train_name => "bee", :time => "12"})
    bye.save()

    expect(Stop.find(hi.stop_id)).to(eq(hi))
  end
end

end
