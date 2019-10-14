class DockingStation
  attr_reader :bikes
	def initialize
		@bikes = [Bike.new]
  end

  def release_bike
    @bikes.pop
  end

  def dock_bike(bike)
    @bikes << bike
  end
  
  
end
  
=begin

  def release_bike
    Bike.new
	end
	
  def dock(bike)
    @bike = bike
  end
=end