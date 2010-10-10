class Device
  require 'tellduscore'
  require_relative 'core_ext/array'
  require_relative 'core_ext/object'

  AVAILABLE_METHODS = Tellduscore::TELLSTICK_TURNON | Tellduscore::TELLSTICK_TURNOFF

  attr_reader :name, :id

  def initialize(hash = {})
    raise ArgumentError unless hash.is_a? Hash
    @name = hash[:name]
    @id = hash[:id]
  end

  # @return [Boolean] true if name and id is present.
  def valid?
    return name.present? && id.present?
  end

  # @return [Symbol] :on or :off.
  def status
    on = Tellduscore.last_sent_command(id, AVAILABLE_METHODS) == Tellduscore::TELLSTICK_TURNON
    on ? :on : :off
  end

  def turn_on
    Tellduscore.turn_on id
  end

  def turn_off
    Tellduscore.turn_off id
  end

  def name=(name)
    @name = name if Tellduscore.set_name(id, name)
  end

  def to_s
    name
  end

  # Get all the devices. That is all the devices Tellstick know about
  # (the content of the file usually located in /etc/tellstick.conf).
  #
  # @return [Array] of devices.
  def self.all
    number_of_devices = Tellduscore.number_of_devices

    number_of_devices.times.inject([]) do |devices, i|
      id = Tellduscore.get_device_id i
      name = Tellduscore.get_name id
      device = Device.new :name => name, :id => id

      devices <<  device if device.valid?
    end
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