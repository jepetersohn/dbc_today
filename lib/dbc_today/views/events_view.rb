require 'colorize'

class EventsView
  def render_events(events)
    "\nSCHEDULE\n".bold +
      "#{header_row}\n" +
      events.map { |event| event_row(event) }.join("\n") +
      "\n"
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
    string = value
             .to_s
             .tr('_', ' ')
             .ljust(width - 1) + ' '

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

    headers.join.underline
  end
  
  def event_row(event)
    cells =
      columns
      .map { |k, v| cell(event.send(k), v) }

    string = cells.join
    
    if event.all_day?
      string.blue
    elsif event.moment?
      string.red
    else
      string
    end
  end
end