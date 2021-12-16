require "docking_station"



describe DockingStation do 
  # check that docking station responds to release_bike
  it { is_expected.to respond_to :release_bike }

  describe "#release_bike" do
    # checks bike that is released is working
    it 'releases working bikes' do
      subject.dock double(:bike, broken?: false)
      subject.dock double(:bike, broken?: true)
      bike = subject.release_bike
      expect(bike.broken?).to eq false
    end

    # checks for error when no bikes are in the staion
    it "raises an error when there are no bikes available" do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end

  describe "#docks bike" do
# checks that it will not accpet bike when station is full
    it "raises an error when full" do
      subject.capacity.times {subject.dock double(:bike)}
      expect {subject.dock double(:bike)}.to raise_error "No space in station"
    end

# expects that broken bike reduces main capacity
    # it "expects broken bikes and reduces capacity" do
    # bike = double(:bike, broken?: true)
    # bike.report_broken
    # subject.dock(bike)
    # expect(subject.capacity).to eq 19
    # end
  end
 
end