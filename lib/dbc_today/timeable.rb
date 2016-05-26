module Timeable
  private

  def in_military(time_string)
    return '00:00' unless time_string =~ /\d(:\d{2})?(a|p)m/

    normalized_time = normalize_time(time_string.dup)

    meridian = normalized_time.slice!(/(a|p)m/)
    if meridian == 'am' || normalized_time.include?('12:')
      normalized_time.rjust(5, '0')
    else
      add_twelve_hours(normalized_time)
    end
  end

  def add_twelve_hours(time_string)
    hours, minutes = time_string.split(':')
    new_hours = (hours.to_i + 12).to_s
    "#{new_hours}:#{minutes}"
  end

  def normalize_time(time_string)
    if time_string.include?(':')
      time_string
    else
      time_string.insert(-3, ':00')
    end
  end
end
