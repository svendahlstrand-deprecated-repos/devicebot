class Home
  require 'tellduscore'
  require_relative 'device'

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