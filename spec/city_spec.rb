require 'spec_helper'


describe ('#City') do

  describe('#save')do
    it('Will allow a user to save a city')do
    city = City.new(:name => "Old Faithful", :city_id => nil)
    city.save
    expect(City.all).to(eq([city]))

    end
  end

  describe('#==') do
  it("is the same city if it has the same name as another city") do
    city = City.new({:name => "Blue", :city_id => nil})
    city2 = City.new({:name => "Blue", :city_id => nil})
    expect(city).to(eq(city2))
  end
end


describe('update') do
  it("allows the user to update the name of the city") do
    city = City.new({:name => "Blue", :city_id => nil})
    city.save()
    city.update("bacon")

    expect(city.name).to(eq("bacon"))
  end
end

describe('delete') do
  it("allows the user to delete a city") do
    city = City.new({:name => "Oink", :city_id =>nil})
    city.save()
    city2 = City.new({:name => "Pig", :city_id =>nil})
    city2.save()
    city.delete()

    expect(City.all).to(eq([city2]))
  end
end

describe('all') do
  it("show all saved citys") do
    city = City.new({:name => "Oink", :city_id =>nil})
    city.save()
    city2 = City.new({:name => "Pig", :city_id =>nil})
    city2.save()

    expect(City.all).to(eq([city, city2]))
  end
end

describe('find') do
  it("allows a user to find a city by its city_id") do
    hi = City.new({:name => "Oink", :city_id =>nil})
    hi.save()
    bye = City.new({:name => "Pig", :city_id =>nil})
    bye.save()

    expect(City.find(hi.city_id)).to(eq(hi))
  end
end





end
