require_relative "bike"

class DockingStation

  attr_accessor :capacity
  attr_accessor :broken
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    # @broken =[]
  end

  # Need to remove bike that is rleased
  def release_bike
    fail "No bikes available" if empty? || @bikes.all? { |bike| bike.broken? }
    i = @bikes.index { |bike| !bike.broken? }
    @bikes.delete_at(i)




  end

  def dock(bike)
    fail "No space in station" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty? 
    @bikes.empty?
  end

end