require 'colorize'

class View
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

  def header_row
    headers =
      columns
      .map { |k, v| k.to_s.ljust(v) }

    headers.join
  end
  
  def event_row(event)
    cells =
      columns
      .map { |k, v| event.send(k).to_s.ljust(v) }

    string = cells.join
    
    if event.all_day?
      string.blue
    else
      string
    end
  end

  def show_events(events)
    puts header_row

    events.each do |event|
      puts event_row(event)
    end
  end
end