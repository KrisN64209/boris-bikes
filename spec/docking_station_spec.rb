require 'docking_station'

describe DockingStation do
  it 'should create a new instance of the DockingStation class' do
    docking_station = DockingStation.new
    expect(docking_station).to be_a(DockingStation)
  end

  it 'should release a bike if working' do
    docking_station = DockingStation.new
    docking_station.dock_bike double(:bike)
    docking_station.release_bike
    expect(docking_station.bikes).to be_empty
  end
  it 'should dock a bike' do
    docking_station = DockingStation.new
    docking_station.dock_bike double(:bike)
    expect(docking_station.bikes.length).to eq 1
  end
  it 'cannot release a bike if there are no bikes available' do
    docking_station = DockingStation.new
    expect { 
      2.times do 
        docking_station.release_bike
      end
    }.to raise_error("Error. No bikes available!")
  end
  it 'docking station cannot accept more bikes than its capacity' do
    docking_station = DockingStation.new
    bike = double(:bike)
    docking_station.dock_bike(bike)
    expect {
      docking_station.max_capacity.times do
        docking_station.dock_bike(bike)
      end
    }.to raise_error("Error. Docking station is full!")
  end
  it 'can accept a custom capacity' do
    docking_station = DockingStation.new(10)
    expect(docking_station.max_capacity).to eq 10
  end

  it 'has a default capacity of 20' do
    docking_station = DockingStation.new
    expect(docking_station.max_capacity).to eq 20
  end
  
  it 'can report a bike as broken' do
    docking_station = DockingStation.new
    bike = double(:bike)
    docking_station.dock_bike(bike, "broken")
    expect(bike.working?).to eq false
  end

  it 'does not release broken bikes' do
    docking_station = DockingStation.new
    bike = double(:bike)
    docking_station.dock_bike(bike, "broken")
    expect{
      docking_station.release_bike
    }.to raise_error("This bike is broken")
  end
end