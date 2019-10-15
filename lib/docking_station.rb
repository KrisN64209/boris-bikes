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

  def dock_bike(bike, status)
    @status = status
    if full?
      raise "Error. Docking station is full!"
    elsif @status = "broken"
      bike.working = false 
    end
    @bikes << bike
  end

  private def full?
    @bikes.length == @max_capacity
  end
  
  # def report(bike, status)
  #   @status = status
  #   if @status = "broken"
  #     bike.working = false
  #   end
  # end
end
