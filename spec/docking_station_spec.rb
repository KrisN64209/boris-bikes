require 'docking_station'

describe DockingStation do
  it 'should create a new instance of the DockingStation class' do
    docking_station = DockingStation.new
    expect(docking_station).to be_a(DockingStation)
  end

  it 'should release a bike' do
    docking_station = DockingStation.new
    bike = docking_station.release_bike 
    expect(docking_station.bikes.length).to eq 0
    expect(bike).to be_a(Bike)
  end
  it 'should dock a bike' do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock_bike(bike, "working")
    expect(docking_station.bikes.length).to eq 2
  end
  it 'cannot release a bike if there are no bikes available' do
    docking_station = DockingStation.new
    expect { 
      2.times do 
        docking_station.release_bike
      end
    }.to raise_error
  end
  it 'docking station cannot accept more bikes than its capacity' do
    docking_station = DockingStation.new
    expect {
      docking_station.max_capacity.times do
        docking_station.dock_bike(Bike.new)
      end
    }.to raise_error
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
    bike = Bike.new
    docking_station.dock_bike(bike, "broken")
    expect(bike.working?).to eq false
  end

  it 'does not release broken bikes' do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock_bike(bike, "broken")
    expect{
      docking_station.release_bike
    }.to raise_error("Sorry, this bike is broken")
  end
end













=begin    it 'should add instances of the Bike class to storage' do
			new_dock = DockingStation.new
			expect(new_dock).to respond_to(:dock).with(Bike.n).argument
    end

    it 'should release bike from docking station' do
      new_dock = DockingStation.new
      new_dock.release_bike
      expect(new_dock.release_bike).to be_a(Bike)
    end
    it 'should call the bike method on docking station class' do
      new_dock = DockingStation.new
      expect(new_dock).to respond_to(:bike)
    end

    it 'docks bike' do
      new_bike = Bike.new
      expect(subject.dock(new_bike)).to eq new_bike
    end
    
    it 'can confirm there is a bike in the dock'
     new_dock = DockingStation.new
     expect(new_dock.is_bike_docked?)
    end
=end