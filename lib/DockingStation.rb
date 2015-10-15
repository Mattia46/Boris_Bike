class DockingStation


  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    fail "No bikes available" if empty?
    fail 'can not release broken bikes' if @bikes.all? {|x| x.broken? }
    @bikes.pop
  end

  def dock_bike(bike)
    fail "Docking Station full" if full?
    @bikes << bike
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
