require "docking_station"

describe DockingStation do 

  describe "#release_bike" do

    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "raises an error when there are no bikes available" do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end

  describe "#docks bike" do
    it "raises an error when full" do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock Bike.new
      end
      expect {subject.dock Bike.new}.to raise_error "No space in station"
    end
  end

end