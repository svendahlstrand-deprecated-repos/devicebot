class Device
  require 'tellduscore'
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
end