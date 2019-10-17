require './lib/bike'

class DockingStation
  @@DEFAULT_CAPACITY = 20
  attr_reader :bikes, :max_capacity
	def initialize(capacity = @@DEFAULT_CAPACITY)
    @bikes = []
    @max_capacity = capacity
  end

  def release_bike
    if empty?
      raise "Error. No bikes available!"
    elsif @status == "broken"
      raise "This bike is broken"
    else
      @bikes.pop
    end
  end

  private def empty?
    @bikes.length == 0
  end

  def dock_bike(bike, status = true)
    @status = status
    if full?
      raise "Error. Docking station is full!"
    elsif @status == "broken"
      bike.working = false 
    end
    @bikes << bike
  end

  private def full?
    @bikes.length == @max_capacity
  end
end