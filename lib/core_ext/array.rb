class Array
  # Turn on all devices.
  def turn_on
    each &:turn_on
  end

  # Turn off all devices.
  def turn_off
    each &:turn_off
  end
end