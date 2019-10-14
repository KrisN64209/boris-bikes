class DockingStation
  @@DEFAULT_CAPACITY = 20
  attr_reader :bikes, :max_capacity
	def initialize(capacity = @@DEFAULT_CAPACITY)
    @bikes = [Bike.new]
    @max_capacity = capacity
  end

  def release_bike
    if empty?
      raise "Error. No bikes available!"
    else
      @bikes.pop
    end
  end

  private def empty?
    @bikes.length == 0
  end

  def dock_bike(bike)
    if full?
      raise "Error. Docking station is full!"
    else
      @bikes << bike
    end
  end

  private def full?
    @bikes.length == @max_capacity
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