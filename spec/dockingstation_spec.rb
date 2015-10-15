require 'dockingstation.rb'

describe DockingStation do

  let(:bike){ double(:bike, {:working? => true})}
  let(:broken_bike){ double(:bike, {working?: @bike, report_broken: @broken, broken?: true})}

  it "should return bike" do
    # allow(bike).to receive(:working?).and_return(@bike)
    expect(bike.working?).to eq true
  end


  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it "return no bikes available" do
    expect { subject.release_bike }.to raise_error "No bikes available"
  end

  it "return bike to docking station" do

    subject.capacity.times { subject.dock_bike(bike) }
    expect { subject.dock_bike(bike) }.to raise_error "Docking Station full"
  end


  it 'can not release broken bike' do
    # allow(bike).to receive(:report_broken).and_return(@broken)
    # allow(bike).to receive(:broken?).and_return(true)

    station = DockingStation.new
    # bike.report_broken
    station.dock_bike broken_bike
    expect {station.release_bike}.to raise_error 'can not release broken bikes'
  end

end
