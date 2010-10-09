class Home
  require 'tellduscore'
  require_relative 'device'

  # Get all the devices in this home. That is all the devices Tellstick know about
  # (the content of the file usually located in /etc/tellstick.conf).
  #
  # @return [Array] of devices.
  def self.devices
    number_of_devices = Tellduscore.number_of_devices

    number_of_devices.times.inject([]) do |devices, i|
      id = Tellduscore.get_device_id i
      name = Tellduscore.get_name id
      device = Device.new :name => name, :id => id

      devices <<  device if device.valid?
    end
  end

  # Turn on all devices in this home.
  def self.turn_on
    devices.each &:turn_on
  end

  # Turn off all devices in this home.
  def self.turn_off
    devices.each &:turn_off
  end

  # Find a device by it's id.
  #
  # @param id the id of the device
  # @return [Device, nil] the device or nil.
  def self.find(id)
    id = id.to_i
    name = Tellduscore.get_name id
    return nil if name.blank?

    Device.new :id => id, :name => name
  end
end