require 'device'

describe Device do
  before :each do
    @valid_device = {
      :name => 'Kitchen lamp',
      :id => '3'
    }
  end

  it 'should be valid' do
    device = Device.new @valid_device
    device.valid?.should == true
  end

  it 'should raise argument error when not initalized with hash' do
    lambda do
      Device.new nil
    end.should raise_error(ArgumentError)
  end

  it 'should be invalid without a name' do
    @valid_device.delete(:name)
    device = Device.new @valid_device
    device.valid?.should == false
  end

  it 'should be invalid without a id' do
    @valid_device.delete(:id)
    device = Device.new @valid_device
    device.valid?.should == false
  end

  it 'should have status on when on' do
    device = Device.new @valid_device
    Tellduscore.should_receive(:td_last_sent_command).with(device.id, Device::AVAILABLE_METHODS).and_return(Tellduscore::TELLSTICK_TURNON)
    device.status.should == :on
  end

  it 'should have status on when off' do
    device = Device.new @valid_device
    Tellduscore.should_receive(:td_last_sent_command).with(device.id, Device::AVAILABLE_METHODS).and_return(Tellduscore::TELLSTICK_TURNOFF)
    device.status.should == :off
  end

  it 'should be able to turn on' do
    device = Device.new @valid_device
    Tellduscore.should_receive(:td_turn_on).with(device.id).and_return(Tellduscore::TELLSTICK_TURNON)
    device.turn_on
  end

  it 'should be able to turn off' do
    device = Device.new @valid_device
    Tellduscore.should_receive(:td_turn_off).with(device.id).and_return(Tellduscore::TELLSTICK_TURNOFF)
    device.turn_off
  end
end