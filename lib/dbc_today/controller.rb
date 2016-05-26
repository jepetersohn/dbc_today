require 'date'
require_relative 'view'
require_relative 'event'

class Controller
  attr_reader :view

  def initialize
    @view = View.new
  end

  def show_schedule(phase, week, day)
    events = Event.where(phase: phase, week: week, day: day)
    view.show_events(events)
  end
end