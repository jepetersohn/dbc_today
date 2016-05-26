module Timeable
  private

  def in_military(time_string)
    return '00:00' unless time_string =~ /\d(:\d{2})?(a|p)m/
    time_string = time_string.dup
    time_string = time_string.insert(-3, ':00') unless time_string.include?(':')
    meridian = time_string.slice!(/(a|p)m/)
    if meridian == 'am' || time_string.include?('12:')
      time_string.rjust(5, '0')
    else
      add_twelve_hours(time_string)
    end
  end

  def add_twelve_hours(time_string)
    hours, minutes = time_string.split(':')
    new_hours = (hours.to_i + 12).to_s
    "#{new_hours}:#{minutes}"
  end
end
