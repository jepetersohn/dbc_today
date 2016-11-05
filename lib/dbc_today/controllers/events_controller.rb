require 'date'
require_relative '../views/events_view'
require_relative '../models/event'

class EventsController
  attr_reader :view

  def initialize
    @view = EventsView.new
  end

  def show_schedule(phase, week, day)
    events = Event.where(phase: phase, week: week, day: day)
    puts view.render_events(events)
  end
end