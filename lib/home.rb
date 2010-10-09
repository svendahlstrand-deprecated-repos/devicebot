class Home
  require 'tellduscore'
  require_relative 'device'

  def self.devices
    devices = []
    number_of_devices = Tellduscore.td_get_number_of_devices

    for i in 0...number_of_devices do
      id = Tellduscore.td_get_device_id i
      name = Tellduscore.td_get_name id
      device = Device.new({ :name => name, :id => id })

      devices <<  device if device.valid?
    end

    devices
  end
end