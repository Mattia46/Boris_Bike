require 'DockingStation.rb'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it { expect(double(:bike).working?).to eq @bike }

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it "return no bikes available" do
    expect { subject.release_bike }.to raise_error "No bikes available"
  end

  it "return bike to docking station" do

    subject.capacity.times { subject.dock_bike(double(:bike)) }
    expect { subject.dock_bike(double(:bike)) }.to raise_error "Docking Station full"
  end


  it 'can not release broken bike' do
    s = DockingStation.new
    b = double(:bike)
    b.report_broken
    s.dock_bike b
    expect {s.release_bike}.to raise_error 'can not release broken bikes'
  end

end
