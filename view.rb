require 'colorize'

class View
  def show_events(events)
    puts header_row

    events.each do |event|
      puts event_row(event)
    end
  end

  private

  def columns
    {
      phase: 6,
      week: 6,
      day: 6,
      description: 20,
      start_time: 12,
      end_time: 12
    }
  end

  def cell(value, width)
    string = value.to_s.ljust(width)

    if string.length > width
      string[0..width - 5] + '... '
    else
      string
    end
  end

  def header_row
    headers =
      columns
      .map { |k, v| cell(k, v) }

    headers.join
  end
  
  def event_row(event)
    cells =
      columns
      .map { |k, v| cell(event.send(k), v) }

    string = cells.join
    
    if event.all_day?
      string.blue
    else
      string
    end
  end
end