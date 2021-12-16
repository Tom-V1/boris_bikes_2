require "bike"

describe Bike do 

  it "can report broken bikes" do
    subject.report_broken
    expect(subject).to be_broken
  end

end