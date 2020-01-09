require 'spec_helper'


describe ('#Train') do

  describe('#save')do
    it('Will allow a user to save a train')do
    train = Train.new(:name => "Old Faithful", :train_id => nil)
    train.save
    expect(Train.all).to(eq([train]))

    end
  end

  describe('#==') do
  it("is the same train if it has the same name as another train") do
    train = Train.new({:name => "Blue", :train_id => nil})
    train2 = Train.new({:name => "Blue", :train_id => nil})
    expect(train).to(eq(train2))
  end
end


describe('update') do
  it("allows the user to update the name of the train") do
    train = Train.new({:name => "Blue", :train_id => nil})
    train.save()
    train.update("bacon")

    expect(train.name).to(eq("bacon"))
  end
end

describe('delete') do
  it("allows the user to delete a train") do
    train = Train.new({:name => "Oink", :train_id =>nil})
    train.save()
    train2 = Train.new({:name => "Pig", :train_id =>nil})
    train2.save()
    train.delete()

    expect(Train.all).to(eq([train2]))
  end
end

describe('all') do
  it("show all saved trains") do
    train = Train.new({:name => "Oink", :train_id =>nil})
    train.save()
    train2 = Train.new({:name => "Pig", :train_id =>nil})
    train2.save()

    expect(Train.all).to(eq([train, train2]))
  end
end

describe('find') do
  it("allows a user to find a train by its train_id") do
    hi = Train.new({:name => "Oink", :train_id =>nil})
    hi.save()
    bye = Train.new({:name => "Pig", :train_id =>nil})
    bye.save()

    expect(Train.find(hi.train_id)).to(eq(hi))
  end
end

describe('.clear') do
it("clears all trains") do
  train = Train.new({:name => "Giant Steps", :train_id => nil})
  train.save()
  train2 = Train.new({:name => "Hi", :train_id => nil})
  train2.save()
  Train.clear()
  expect(Train.all).to(eq([]))
end
end


#method below may not be passing

describe('delete_train_stops') do
  it("allows the user to delete all of the stops for a given train") do

    train = Train.new({:name => "Giant Steps", :train_id => nil})
    train.save()
    stop = Stop.new(:city_name => "Chicago", :train_name => "Giant Steps", :time => "12", :stop_id => nil)
    stop.save()
    stop3 = Stop.new(:city_name => "Chicago", :train_name => "Giant Steps", :time => "124", :stop_id => nil)
    stop3.save()
    stop2 = Stop.new(:city_name => "Chicagox", :train_name => "Hid", :time => "124", :stop_id => nil)
    stop2.save()
    train.delete_train_stops()
    expect(Stop.all).to(eq([stop2]))
  end
end




end
