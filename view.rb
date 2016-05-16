class View
  def show_headers
    headers = 'phase'.ljust(6)
    headers += 'week'.ljust(6)
    headers += 'day'.ljust(6)
    headers += 'description'.ljust(20)
    headers += 'start_time'.ljust(12)
    headers += 'end_time'.ljust(12)
    puts headers
  end
  
  def show_event(event)
    row = event.phase.to_s.ljust(6)
    row += event.week.to_s.ljust(6)
    row += event.day.to_s.ljust(6)
    row += event.description.to_s.ljust(20)
    row += event.start_time.to_s.ljust(12)
    row += event.end_time.to_s.ljust(12)
    puts row
  end

  def show_events(events)
    show_headers

    events.each do |event|
      show_event event
    end
  end
end