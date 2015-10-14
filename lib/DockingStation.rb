class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail "Docking Station full" if full?
    @bikes << bikes
  end

end

private
def empty?
   @bikes.empty?
end

private
def full?
  @bikes.count >= capacity
end


class Bike

  def working?
    @bike
  end

end
