class Home
  require 'tellduscore'
  require_relative 'device'

  # Get all the devices in this home. That is all the devices Tellstick know about
  # (the content of the file usually located in /etc/tellstick.conf).
  #
  # @return [Array] of devices.
  def self.devices
    number_of_devices = Tellduscore.td_get_number_of_devices

    number_of_devices.times.inject([]) do |devices, i|
      id = Tellduscore.td_get_device_id i
      name = Tellduscore.td_get_name id
      device = Device.new :name => name, :id => id

      devices <<  device if device.valid?
    end
  end
end