require_relative "bike"

class DockingStation

  attr_accessor :capacity
  attr_accessor :broken
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken =[]
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "No space in station" if full?
    if bike.broken? == true
      @broken << bike
      @capacity -= 1
    else
      @bikes << bike
    end
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty? 
    @bikes.empty?
  end

end