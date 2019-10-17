require 'van'
require 'docking_station'
require 'bike'

describe Van do
  it 'can collect broken bikes' do
    van = Van.new
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock_bike(bike, "broken")
    broken_bikes = docking_station.release_broken_bikes
    van.collect_bikes(broken_bikes)
    expect(van.collected_bikes).to include (broken_bikes)
  end
end