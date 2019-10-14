class DockingStation
  attr_reader :bikes, :max_capacity
	def initialize
    @bikes = [Bike.new]
    @max_capacity = 9
  end

  def release_bike
    if @bikes.length == 0
      raise "Error. No bikes available!"
    else
      @bikes.pop
    end
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