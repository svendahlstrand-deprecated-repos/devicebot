class Device
  require 'tellduscore'

  AVAILABLE_METHODS = Tellduscore::TELLSTICK_TURNON | Tellduscore::TELLSTICK_TURNOFF

  attr_reader :name, :id

  def initialize(hash = {})
    raise ArgumentError unless hash.is_a? Hash
    @name = hash[:name]
    @id = hash[:id]
  end

  def valid?
    return name.present? && id.present?
  end

  def status
    on = Tellduscore.td_last_sent_command(id, AVAILABLE_METHODS) == Tellduscore::TELLSTICK_TURNON
    on ? :on : :off
  end

  def turn_on
    Tellduscore.td_turn_on id
  end

  def turn_off
    Tellduscore.td_turn_off id
  end
end

class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end

  def present?
    !blank?
  end
end